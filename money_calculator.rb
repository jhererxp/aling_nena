class MoneyCalculator
require 'sinatra'

attr_accessor :ones, :fives, :tens, :twenties, :fifties, :hundreds, :five_hundreds, :thousands

	def initialize(ones, fives, tens, twenties, fifties, hundreds, five_hundreds, thousands)
		#total_ones = 1 * ones
		#total_fives = 5 * fives
		#total_tens = 10 * tens
		#total_twenties = 20 * twenties
		#total_fifties = 50 * fifties
		#total_hundreds = 100 * hundreds
		#total_five_hundreds = 500 * five_hundreds
		#total_thousands = 1000 * thousands
		#total_payment = total_ones + total_fives + total_tens + total_twenties + total_fifties + total_hundreds + total_five_hundreds + total_thousands
		self.ones = ones.to_i
		self.fives = fives.to_i
		self.tens = tens.to_i
		self.twenties = twenties.to_i
		self.fifties = fifties.to_i
		self.hundreds = hundreds.to_i
		self.five_hundreds = five_hundreds.to_i
		self.thousands = thousands.to_i
		
	end
	
	def total_payment
		ones*1 + fives*5 + tens*10 + twenties*20 + fifties*50 + hundreds*100 + five_hundreds*500 + thousands*1000
	end
	
	def change_amount(payment, cost)
		payment - cost
	end
	
	def change(cost)
		@cost = cost.to_f
		@total_payment = total_payment.to_f
		@change_amount = change_amount(@total_payment, @cost)
		@thousands_amount = (@change_amount/1000).to_i
		@change_amount_less_thousand = change_amount(@change_amount, @thousands_amount*1000)
		@five_hundreds_amount = ((@change_amount_less_thousand%1000)/500).to_i
		@change_amount_less_five_hundred = change_amount(@change_amount_less_thousand, @five_hundreds_amount*500)	
		@hundreds_amount = ((@change_amount_less_five_hundred%500)/100).to_i
		@change_amount_less_hundred = change_amount(@change_amount_less_five_hundred, @hundreds_amount*100)	
		@fifties_amount = ((@change_amount_less_hundred%100)/50).to_i
		@change_amount_less_fifty = change_amount(@change_amount_less_hundred, @fifties_amount*50)	
		@twenties_amount = ((@change_amount_less_fifty%50)/20).to_i
		@change_amount_less_twenty = change_amount(@change_amount_less_fifty, @twenties_amount*20)
		@tens_amount = ((@change_amount_less_twenty%20)/10).to_i
		@change_amount_less_ten = change_amount(@change_amount_less_twenty, @tens_amount*10)		
		@fives_amount = ((@change_amount_less_ten%10)/5).to_i
		@change_amount_less_five = change_amount(@change_amount_less_ten, @fives_amount*5)
		@ones_amount = (@change_amount_less_five%5).to_i
		
		@change_hash = {:ones => @ones_amount, :fives => @fives_amount, :tens => @tens_amount, :twenties => @twenties_amount, :fifties => @fifties_amount, :hundreds => @hundreds_amount, :five_hundreds => @five_hundreds_amount, :thousands => @thousands_amount}
	end
end	
