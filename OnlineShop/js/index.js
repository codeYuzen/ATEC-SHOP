let arrayOfProducts = [];
let cart = [];
let getProducts = function (filter) {
	let xhttp = new XMLHttpRequest();
		//creates a new object that allows to make http requests to the server
	xhttp.onreadystatechange = function () {
		if (this.readyState === 4 && this.status === 200) {
			//if the request has been completed AND the response status is OK
			arrayOfProducts = JSON.parse(xhttp.responseText);
			if (filter !== 'All Products' && filter !== undefined) arrayOfProducts = arrayOfProducts.filter(p => p.category === filter);
			buildProductRows(arrayOfProducts);
		}
	};

	xhttp.open("GET", "http://localhost:3000/components", true);
	xhttp.send();
};

//cards builder to send to index.html
let buildCard = function (_product) {
	let card = `<div class="col hp">
				<div class="card h-100 shadow-sm">
					<div class="clearfix">
						<span class="float-start badge rounded-pill text-black bg-warning">
							${_product.category}
						</span>
						<span class="float-end badge rounded-pill text-black bg-warning bg-warning">
							${_product.manufacturer}
						</span>
					</div>
					<img src="${_product.photo}" class="card-img-top" alt="product.title"
						style="width: 100%; height: 200px; object-position: center">
					<div class="card-body">
						<h5 class="card-title">
							${_product.model}
						</h5>
						<div class="clearfix mb-2">
							<span class="float-start" style="font-size: 10px">
								${_product.serial}
							</span>
							<span class="float-end badge rounded-pill text-black bg-warning bg-success">
								PRICE: ${_product.price} €
							</span>
						</div>
						<div class="clearfix mb-1">
							<span class="float-start">
								Stock: ${_product.stock}
							</span>
							<span class="float-end">
								<a target="blank" href="${_product.details}" class="small text-muted text-uppercase aff-link">Details</a>
							</span>
						</div>
						<div class="d-grid gap-2 my-4">
							<button class="btn btn-warning bold-btn" onclick="addCartItem(${_product.id}, '${_product.model}', '${_product.photo}', ${_product.price}, '${_product.stock}')">
								<i class="fas fa-shopping-cart me-2"></i> Add to cart
							</button>
						</div>
					</div>
				</div>
			</div>`;

	return card;
}

//this will create a new row of products
let buildRow = function (_prods) {
	let row = '';

	row += `<div class="row row-cols-1 row-cols-xs-2 row-cols-sm-2 row-cols-lg-4 g-3 mb-3 mt-2">`;

	for (let prod of _prods) {
		row += buildCard(prod);
	}

	row += `</div>`;

	return row;
}

//when 4 products are added to the index.html this ensures that the next products will be added below the first 4 and so on...
let buildProductRows = function (products) {
	let rows = '';

	while (products.length > 0) {
		let productsInRow = products.splice(0, 4);

		rows += buildRow(productsInRow);
	}

	document.getElementById('product_rows').innerHTML = rows;
};

let addCartItem = function (id, model, photo, price, stock) {
	let found = false;

	for (let item of cart) {
		if (item.id === id) {
			found = true;

			if (item.quantity < item.stock) {
				item.quantity++;
				item.price += price;
			}
		}
	}

	if (found === false) {
		cart.push({
			id: id,
			quantity: 1,
			model: model,
			photo: photo,
			price: price,
			stock: stock
		});
	}
	
	buildCartItems();
	getPrice();
};

let getPrice = function () {
	let cartPrice = 0;

	for (let item of cart) {
		cartPrice += item.price;
	}

	document.getElementById('cart_Price').innerHTML = `Price: ${cartPrice} €`
}

let buildCartItems = function () {
	let items = '';

	for (let item of cart) {
		items += buildCartItem(item);
	}

	document.getElementById('cart_items').innerHTML = items;
};

let buildCartItem = function (i) {
	item = `<li class="list-group-item d-flex justify-content-between align-items-center" id="${i.id}">
				<span>
					<img src="${i.photo}" style="width: 50px; height: auto; margin-right: 10px;">${i.model} - Qnt: ${i.quantity} - Price: ${i.price} €
				</span>
				<div class="btn-group">
					<button class="btn btn-warning btn-sm" onclick="decrementItem(${i.id})">-</button>
					<button class="btn btn-warning btn-sm" onclick="incrementItem(${i.id})">+</button>
				</div>
			</li>`;

	return item;
}

let decrementItem = function (id) {
	let i = cart.findIndex((item => item.id === id));

	if(cart[i].quantity === 1) {
		cart.splice(i, 1);
	}
	else {
		cart[i].price -= cart[i].price / cart[i].quantity;
		cart[i].quantity--;
	}

	buildCartItems();
	getPrice();
}

let incrementItem = function (id) {
	let i = cart.findIndex((item => item.id === id));

	if(cart[i].quantity < cart[i].stock) {
		cart[i].price += cart[i].price / cart[i].quantity;
		cart[i].quantity++;
		buildCartItems();
	}

	getPrice();
}

//this ensures that when the website is completly loaded and is ready to be manipulated and interacted with, the event lister will execute the 'getComponents' function.
document.addEventListener('DOMContentLoaded', () => {
	getProducts();
});