class User < ActiveRecord::Base
  attr_accessible :name, :email, :password, :password_confirmation

  has_many :orders, :dependent => :destroy

	has_secure_password

  before_save :create_remember_token
  #before_save ist ein filter in rails; wir brauchen das hier (extra attribut von user, bei dem wir den user tracken können auf einen encrpted way)
  #wir erstellen create_remember_token hier damit wir ihn später aufrufen können
  #das is jetzt ein schneller weg, um unseren user zu finden

  validates :email, uniqueness: true, presence: true
  #bedeutet: im Bezug auf Email validieren wir die Uniwueness und die Presence
  validates :name, presence: true
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true
  #stellt sicher dass der user sein password zweimal eingibt bevor er weitergehen darf

	def create_remember_token
		self.remember_token = SecureRandom.urlsafe_base64
	end
	#self innerhalb einer methode referenziert hier die instanz des users, der sich gerade eingeloggt hat
	#SecureRand.urlsafe_base64 => diese mthode gibt einem user einen 64 bit ekncrypted schlsüsel für sein pw, das wir ins 
	#cookie storen können (wir wollen den token ja nich als string speichern im cookie)
	#gibt dem user einen verschlüsselten token und matched ihn mit dem token von self, also von dem user, der sich gerade eingeloggt hat

end
