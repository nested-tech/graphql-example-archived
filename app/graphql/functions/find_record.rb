class Functions::FindRecord < GraphQL::Function
  attr_reader :type

  def initialize(model:, type:)
    @model = model
    @type = type
  end

  argument :id, GraphQL::ID_TYPE

  def call(_obj, args, _ctx)
    @model.find(args[:id])
  end
end
