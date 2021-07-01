class Api::V1::CirclesController < Api::V1::GraphitiController
  def index
    circles = CircleResource.all(params)
    respond_with(circles)
  end

  def show
    circle = CircleResource.find(params)
    respond_with(circle)
  end

  def create
    circle = CircleResource.build(params)

    if circle.save
      render jsonapi: circle, status: 201
    else
      render jsonapi_errors: circle
    end
  end

  def update
    circle = CircleResource.find(params)

    if circle.update_attributes
      render jsonapi: circle
    else
      render jsonapi_errors: circle
    end
  end

  def destroy
    circle = CircleResource.find(params)

    if circle.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: circle
    end
  end
end
