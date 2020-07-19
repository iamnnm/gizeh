# frozen_string_literal: true

FactoryBot.define do
  sequence :number do |n|
    n
  end

  sequence :string do |n|
    "string#{n}"
  end

  sequence :email do |n|
    "email#{n}@ya.com"
  end
end

# module FactoryBotAdditions
#   # create instance without running callbacks and validations
#   def insert(*args)
#     record = pure(*args)
#     def record.run_callbacks(*args, &block)
#       if block_given?
#         block.arity.zero? ? yield : yield(self)
#       end
#     end
#     record.save!
#     record
#   end
#
#   def pure(*args)
#     factory_name = args.shift
#     if args.last.is_a?(Hash)
#       options = args.pop
#     else
#       options = {}
#     end
#     traits = [:pure] | args
#     build(factory_name, *traits, options)
#   end
# end
