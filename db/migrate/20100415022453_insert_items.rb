class InsertItems < ActiveRecord::Migration
  def self.up
    descr =<<-Chon
      The Nokia 2610 helps you take control of your communications. Making notes is easier with the Voice Recorder function. Bring your messages to life and get yourself heard: with Nokia Xpress Audio Messaging you can now let colleagues and friends hear exactly how you feel.
    Chon
    Product.create :name => "Nokia 2610", :byline => 'Nokia', :description => descr, :price => 1210, :weight => 10
    Product.create :name => "Nokia 1600", :byline => 'Nokia', :description => descr, :price => 151, :weight => 10
    Product.create :name => "Nokia 6030", :byline => 'Nokia', :description => descr, :price => 1101, :weight => 10
    Product.create :name => "Nokia 7373", :byline => 'Nokia', :description => descr, :price => 111, :weight => 10
    Product.create :name => "Nokia 6060", :byline => 'Nokia', :description => descr, :price => 111, :weight => 10
    Product.create :name => "Nokia N73 MUSIC EDITION", :byline => 'Nokia', :description => descr, :price => 111, :weight => 10
    Product.create :name => "Nokia 7390", :byline => 'Nokia', :description => descr, :price => 111, :weight => 10
    Product.create :name => "Sony Ericsson W950i", :byline => 'Nokia', :description => descr, :price => 111, :weight => 10
    Product.create :name => "Motorola K1", :byline => 'Nokia', :description => descr, :price => 111, :weight => 10
    Product.create :name => "Nokia N73", :byline => 'Nokia', :description => descr, :price => 111, :weight => 10
    Product.create :name => "Nokia 2100", :byline => 'Nokia', :description => descr, :price => 111, :weight => 10
    Product.create :name => "APPLE IMAC 20 2.16GHZ/1GB/250GB/SD/X1600", :byline => 'Nokia', :description => descr, :price => 2500, :weight => 10
    Product.create :name => "Nokia 5800", :byline => 'Nokia', :description => descr, :price => 111, :weight => 10
    Product.create :name => "Nokia 1100", :byline => 'Nokia', :description => descr, :price => 111, :weight => 10
  end

  def self.down
  end
end
