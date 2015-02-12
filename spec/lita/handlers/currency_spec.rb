require "spec_helper"

describe Lita::Handlers::Currency, lita_handler: true do

  it { is_expected.to route_command('currency').to(:fetch) }
  it { is_expected.to route_command('currency nbu').to(:fetch) }
  it { is_expected.to route_command('currency cash').to(:fetch) }
  it { is_expected.to route_command('currency card').to(:fetch) }

end
