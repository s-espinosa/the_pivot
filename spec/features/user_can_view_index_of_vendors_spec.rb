require 'rails_helper'

RSpec.feature "User can view index of vendors" do
  scenario "user goes to path '/vendors' and sees all vendors" do

    vendor1 = Vendor.create(name: "Store Name1", status: 1)
    photo1 = Photo.create(title: "photo1", image: File.new("#{Rails.root}/spec/support/fixtures/people_1.jpg"), price: 20, description: "description", vendor_id: vendor1.id)
    photo2 = Photo.create(title: "photo2", image: File.new("#{Rails.root}/spec/support/fixtures/people_1.jpg"), price: 20, description: "description", vendor_id: vendor1.id)

    vendor2 = Vendor.create(name: "Store Name2", status: 1)
    photo3 = Photo.create(title: "photo3", image: File.new("#{Rails.root}/spec/support/fixtures/people_1.jpg"), price: 20, description: "description", vendor_id: vendor2.id)
    photo4 = Photo.create(title: "photo4", image: File.new("#{Rails.root}/spec/support/fixtures/people_1.jpg"), price: 20, description: "description", vendor_id: vendor2.id)

    vendor3 = Vendor.create(name: "Store Name3", status: 1)
    photo5 = Photo.create(title: "photo5", image: File.new("#{Rails.root}/spec/support/fixtures/people_1.jpg"), price: 20, description: "description", vendor_id: vendor3.id)
    photo6 = Photo.create(title: "photo6", image: File.new("#{Rails.root}/spec/support/fixtures/people_1.jpg"), price: 20, description: "description", vendor_id: vendor3.id)

    visit vendors_path
    within(".vendor-index") do
      expect(page).to have_content("Store Name1")
      expect(page).to have_xpath("//img[@src=\"#{photo1.image}\"]")
      expect(page).to have_no_xpath("//img[@src=\"#{photo2.image}\"]")

      expect(page).to have_content("Store Name2")
      expect(page).to have_xpath("//img[@src=\"#{photo3.image}\"]")
      expect(page).to have_no_xpath("//img[@src=\"#{photo4.image}\"]")

      expect(page).to have_content("Store Name3")
      expect(page).to have_xpath("//img[@src=\"#{photo5.image}\"]")
      expect(page).to have_no_xpath("//img[@src=\"#{photo6.image}\"]")
    end
  end
end
