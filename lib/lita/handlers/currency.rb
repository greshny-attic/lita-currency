require 'privatbank/p24/exchange_rates'

module Lita
  module Handlers
    class Currency < Handler

      route(/^currency\s*(:?nbu|cash|card)*/, :fetch, command: true,
                        help: {'currency [nbu|card|cash]' => 'fetches exchange rates for UAH from Privatbank'})

      def fetch(response)
        rates = case response.matches[0][0]
                when 'card' then Privatbank::P24::ExchangeRates.card
                when 'cash' then Privatbank::P24::ExchangeRates.cash
                when 'nbu'  then Privatbank::P24::ExchangeRates.nbu
                else
                  Privatbank::P24::ExchangeRates.cash
                end
        response.reply rates.map { |c| "#{c.ccy} - #{c.buy} / #{c.sale}\n" }.join(' ')
      end
    end

    Lita.register_handler(Currency)
  end
end
