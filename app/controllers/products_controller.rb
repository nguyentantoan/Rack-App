class ProductsController <Frack::BaseController
  def index
    @products = Product.all
    render('products/index')
  end

  def new
    @product = Product.new
    render('products/new')
  end

  def create
    @product = Product.new product_params
    if @product.save
      redirect('/products')
    else
      render('products/new')
    end
  end

  private

  def product_params
    request.params['product']
  end
end
