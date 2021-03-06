# == Schema Information
#
# Table name: order_entries
#
#  id                  :bigint(8)        not null, primary key
#  order_id            :integer
#  product_id          :integer
#  price               :decimal(, )
#  cost                :decimal(, )
#  tax                 :decimal(, )
#  quoted_by           :integer
#  quantity            :integer
#  vendor              :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  category_id         :integer
#  status              :integer          default(1)
#  dynamic_fields      :string
#  specs               :text
#  vendor_quote_prices :text
#  notes               :text
#

class OrderEntry < ApplicationRecord
  belongs_to :order
  belongs_to :chatroom_order, class_name: 'Order'
  belongs_to :product
  has_many :item_messages

  scope :product_wd_messages, -> { joins(:order, :product) }

  def attachments
    @urls = []
    OrderEntryAttachment.where(:order_entry_id => self.id).order('id DESC').each do |attachment|
      @urls.push({:id => attachment.id, :file_name => attachment.attachment_file_file_name, :file_size => attachment.attachment_file_file_size, :updated_at => attachment.attachment_file_updated_at, :url_path =>  attachment.attachment_file.url})
    end
    @urls
  end

  # ********* NOTE *******
  # Product can be access directly through order_entry.product
  def product
    if self.product_id.present?
      Product.find(self.product_id)
    end
  end

  def product_picture
    if self.product_id.present?
      product = Product.find(self.product_id)
      @url = "#{ActionController::Base.helpers.asset_path('default-product.png')}"
      if product.image_data?
        @url = product.image_url(:original)
      elsif product.picture.exists?
        @url = product.picture.url
      end
      @url
    end
  end

  def specs_html
    self.specs.to_s.gsub("\n", "<").gsub("<", "<br/>").html_safe
  end

  def vendor_quote_prices_html
    self.vendor_quote_prices.to_s.gsub("\n", "<").gsub("<", "<br/>").html_safe
  end

  def notes_html
    self.notes.to_s.gsub("\n", "<").gsub("<", "<br/>").html_safe
  end

  def convert_dynamic_fields
    if self.dynamic_fields.present? && !self.dynamic_fields.nil?
      self.dynamic_fields.gsub("=>", ":")
    else
      ''
    end
  end

  def get_html_safe_fields
    @dyna_fields = ''
    if self.dynamic_fields.present? && !self.dynamic_fields.nil? && self.dynamic_fields != ''
      eval(self.dynamic_fields).each {|key, value| @dyna_fields = @dyna_fields + "#{key}: #{value}<br/>" }
      @dyna_fields
    end
  end

  def product_name
    if self.product_id.present?
      product = Product.find(self.product_id)
      product.name
    end
  end

  def quoted_name
    if self.quoted_by.present?
      user = User.find(self.quoted_by)
      user.first_name + " " + user.last_name
    end
  end

  def vendor_name
    @names = []
    Vendor.where("id IN (SELECT vendor_id FROM order_entry_vendors WHERE order_entry_id = #{self.id})").each do |vendor|
      @names.push(vendor.name)
    end
    @names.map(&:inspect).join(', ').gsub!('"', '')
  end

  def category_name
    if self.category_id.present?
      category = Category.find(self.category_id)
      category.name
    end
  end
  def category
    obj = {}
    if self.category_id.present?
      category = Category.find(self.category_id)
      obj = {:id => category.id, :name => category.name, :view => category.name}
    end
    obj
  end
  def product_hash
    obj = {}
    if self.product_id.present?
      product = Product.find(self.product_id)
      obj = {:id => product.id, :name => product.name, :view => product.name}
    end
    obj
  end
  def vendor_obj
    obj = {}
    if self.vendor.present?
      vendor = Vendor.find(self.vendor)
      obj = {:id => vendor.id, :name => vendor.name, :view => vendor.name}
    end
    obj
  end
  def quoted_by_obj
    obj = {}
    if self.quoted_by.present?
      user = User.find(self.quoted_by)
      obj = {:id => user.id, :name => user.full_name, :view => user.full_name}
    end
    obj
  end

  def get_status
    status = self.status
    @txt = ''
    if status == 0
      @txt = 'New'
    elsif status == 1
      @txt = 'Quoting'
    elsif status == 2
      @txt = 'Pending Approval'
    elsif status == 3
      @txt = 'Ready to Process'
    elsif status == 4
      @txt = 'In Production'
    elsif status == 5
      @txt = 'Shipped'
    elsif status == 6
      @txt = 'Delivered'
    end
    @txt
  end

  def vendor_list
    @ids = []
    OrderEntryVendor.where(:order_entry_id => self.id).each do |oev|
      @ids.push(oev.vendor_id)
    end
    @ids
  end

  def vendor_email
    vendor_list = OrderEntryVendor.where(:order_entry_id => self.id).pluck(:vendor_id).join(',')
    if vendor_list != ""
      Vendor.where("id IN (#{vendor_list})").pluck(:email).map(&:inspect).join(',').gsub!('"', '')
    else
      ""
    end
  end

  def picture_url
    product = Product.find(self.product_id)
    @url = "#{ActionController::Base.helpers.asset_path('default-product.png')}"
    if product.image_data?
      @url = product.image_url(:original)
    elsif product.picture.exists?
      @url = product.picture.url
    end
    @url
  end
end
