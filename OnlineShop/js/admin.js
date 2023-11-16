let arrayOfComponents = [];
let getComponents = function () {
	let xhttp = new XMLHttpRequest();

	xhttp.onreadystatechange = function () {
		if (this.readyState === 4 && this.status === 200) {
			arrayOfComponents = JSON.parse(xhttp.responseText);
			buildRows(arrayOfComponents);
		}
	};

	xhttp.open("GET", "http://localhost:3000/components", true);
	xhttp.send();
};

//verifing if its an url or not
let insertComponent = function (component) {
	const isValidUrl = urlString => {
		let urlPattern = new RegExp('^(https?:\\/\\/)?' +
			'((([a-z\\d]([a-z\\d-]*[a-z\\d])*)\\.)+[a-z]{2,}|' +
			'((\\d{1,3}\\.){3}\\d{1,3}))' +
			'(\\:\\d+)?(\\/[-a-z\\d%_.~+]*)*' +
			'(\\?[;&a-z\\d%_.~+=-]*)?' +
			'(\\#[-a-z\\d_]*)?$', 'i');
		return !urlPattern.test(urlString);
	}

	let warn = "";
	let serial = document.getElementById("inputSerial").value;
	let price = document.getElementById("inputPrice").value;
	let category = document.getElementById("inputCategory").value;
	let manufacturer = document.getElementById("inputManufacturer").value;
	let model = document.getElementById("inputModel").value;
	let color = document.getElementById("inputColor").value;
	let photo = document.getElementById("inputPhoto").value;
	let stock = document.getElementById("inputStock").value;
	let details = document.getElementById("inputDetails").value;

	if (serial.length < 3) warn += "Serial is invalid\n";
	if (price < 0) warn += "Price is invalid\n";
	if (category === "Select Category") warn += "Category is invalid\n";
	if (manufacturer === "Select Manufacturer") warn += "Manufacturer is invalid\n";
	if (model.length < 3) warn += "Model is invalid\n";
	if (color.length < 3) warn += "Color is invalid\n";
	if (isValidUrl(photo)) warn += "Photo is invalid\n";
	if (stock < 0) warn += "Stock is invalid\n";
	if (isValidUrl(details)) warn += "Details is invalid\n";

	if (warn.length > 0) return alert(warn);

	let xhttp = new XMLHttpRequest();

	xhttp.onreadystatechange = function () {
		if (this.readyState === 4 && this.status === 200) {
			let component = JSON.parse(xhttp.responseText);
			buildNewRow(component);
		}
	};

	xhttp.open("POST", "http://localhost:3000/addComponent", true);
	xhttp.setRequestHeader("Content-type", "application/json;charset=UTF-8");
	xhttp.send(JSON.stringify(component));

	getComponents();
};

//delete components in db
let deleteComponent = function (id) {
	let xhttp = new XMLHttpRequest();

	xhttp.open("POST", "http://localhost:3000/deleteComponent", true);
	xhttp.setRequestHeader("Content-type", "application/json;charset=UTF-8");
	xhttp.send(JSON.stringify({ id: id }));

	deleteRow(id);
	getComponents();
};

// for organizing purposes this deleteRow exists
let deleteRow = function (id) {
	let row = document.getElementById(`component-id-${id}`);

	row.remove();
};
//adds a new row when you create a row in the admin.html this is for performance purposes, so we don't get the components from the db to add to the rows everytime we add a new component
let buildNewRow = function (component) {
	let rows = document.getElementsByTagName("tbody")[0].innerHTML ?? "";
	let newRow = "";

	rows += `<tr data-p-id="component-id-${component.id}" id="component-id-${component.id}">`;
	rows += `<td><button type="button" class="btn btn-secondary btn-sm" onclick="clickEditComponent(${component.id})"><i class="fa-solid fa-pen-to-square"></i></button></td>`;
	rows += `<td>${component.serial}</td>`;
	rows += `<td>${component.price}€</td>`;
	rows += `<td>${component.category}</td>`;
	rows += `<td>${component.manufacturer}</td>`;
	rows += `<td>${component.model}</td>`;
	rows += `<td>${component.color}</td>`;
	rows += `<td><img src="${component.photo}" style="height: 75px; width: 75px; object-fit: cover;"></td>`;
	rows += `<td>${component.stock}</td>`;
	rows += `<td><a href="${component.details}"><button type="button" class="btn btn-info btn-sm"><i class="fa-solid fa-circle-info" style="color: white;"></i></button></a></td>`;
	rows += `<td><button type="button" class="btn btn-danger btn-sm" onclick="clickDeleteComponent(${component.id})"><i class="fa-solid fa-trash"></i></button></td>`;
	rows += "</tr>";

	document.getElementsByTagName("tbody")[0].innerHTML = rows + newRow;
};

//creates rows based on what components are in the database
let buildRows = function (comps) {
	let rows = "";

	for (let component of comps) {
		rows += `<tr data-p-id="component-id-${component.id}" id="component-id-${component.id}">`;
		rows += `<td><button type="button" class="btn btn-secondary btn-sm" onclick="clickEditComponent(${component.id})"><i class="fa-solid fa-pen-to-square"></i></button></td>`;
		rows += `<td>${component.serial}</td>`;
		rows += `<td>${component.price}€</td>`;
		rows += `<td>${component.category}</td>`;
		rows += `<td>${component.manufacturer}</td>`;
		rows += `<td>${component.model}</td>`;
		rows += `<td>${component.color}</td>`;
		rows += `<td><img src="${component.photo}" style="height: 75px; width: 75px; object-fit: cover;"></td>`;
		rows += `<td>${component.stock}</td>`;
		rows += `<td><a href="${component.details}"><button type="button" class="btn btn-info btn-sm"><i class="fa-solid fa-circle-info" style="color: white;"></i></button></a></td>`;
		rows += `<td><button type="button" class="btn btn-danger btn-sm" onclick="clickDeleteComponent(${component.id})"><i class="fa-solid fa-trash"></i></button></td>`;
		rows += "</tr>";
	}

	document.getElementsByTagName("tbody")[0].innerHTML = rows;
};

//to edit components
let clickEditComponent = function (id) {
	let component = arrayOfComponents.find((i) => i.id === id);
	let editRow = "";

	editRow += `<td><button type="button" class="btn btn-success btn-sm" onclick="clickUpdateComponent(${component.id})"><i class="fa-solid fa-square-check"></i></button></td>`;
	editRow += `<td><input type="text" placeholder="Serial" oninput="this.value = this.value.toUpperCase()" class="form-control" id="tblInputSerial-${component.id}" value="${component.serial}"></td>`;
	editRow += `<td><input type="number" placeholder="Number" step="0.01" min="0" class="form-control" id="tblInputPrice-${component.id}" value="${component.price}"></td>`;
	editRow += `<td><select id="tblInputCategory-${component.id}" class="form-control">
						<option value="Cases">Cases</option>
						<option value="Coolers">Coolers</option>
						<option value="Graphics Cards">Graphics Cards</option>
						<option value="Memory">Memory</option>
						<option value="Motherboards">Motherboards</option>
						<option value="Power Supplies">Power Supplies</option>
						<option value="Processors">Processors</option>
						<option value="Storage">Storage</option>
					</select></td>`;
	editRow += `<td><select id="tblInputManufacturer-${component.id}" class="form-control">
						<option value="Acer">Acer</option>
						<option value="AMD">AMD</option>
						<option value="ARCTIC">ARCTIC</option>
						<option value="ASRock">ASRock</option>
						<option value="Asus">Asus</option>
						<option value="be quiet!">be quiet!</option>
						<option value="Cooler Master">Cooler Master</option>
						<option value="Corsair">Corsair</option>
						<option value="Crucial">Crucial</option>
						<option value="Deepcool">Deepcool</option>
						<option value="EVGA">EVGA</option>
						<option value="Fractal Design">Fractal Design</option>
						<option value="G.Skill">G.Skill</option>
						<option value="Gigabyte">Gigabyte</option>
						<option value="Intel">Intel</option>
						<option value="Kingston">Kingston</option>
						<option value="KIOXIA">KIOXIA</option>
						<option value="Lian Li">Lian Li</option>
						<option value="Noctua">Noctua</option>
						<option value="NOX">NOX</option>
						<option value="MSI">MSI</option>
						<option value="NVIDIA">NVIDIA</option>
						<option value="NZXT">NZXT</option>
						<option value="Samsung">Samsung</option>
						<option value="Sapphire">Sapphire</option>
						<option value="Seagate">Seagate</option>
						<option value="SeaSonic">SeaSonic</option>
						<option value="Thermaltake">Thermaltake</option>
						<option value="Western Digital">Western Digital</option>
						<option value="XFX">XFX</option>
						<option value="Zotac">Zotac</option>
					</select></td>`;
	editRow += `<td><input type="text" placeholder="Model" class="form-control" id="tblInputModel-${component.id}" value="${component.model}"></td>`;
	editRow += `<td><select id="tblInputColor-${component.id}" class="form-control">
						<option value="None">None</option>
						<option value="Beige">Beige</option>
						<option value="Black">Black</option>
						<option value="Blue">Blue</option>
						<option value="Camo">Camo</option>
						<option value="Gold">Gold</option>
						<option value="Grey">Grey</option>
						<option value="Green">Green</option>
						<option value="Orange">Orange</option>
						<option value="Purple">Purple</option>
						<option value="Red">Red</option>
						<option value="Silver">Silver</option>
						<option value="Yellow">Yellow</option>
						<option value="White">White</option>
					</select></td>`;
	editRow += `<td><input type="url" placeholder="URL" class="form-control" id="tblInputPhoto-${component.id}" value="${component.photo}"></td>`;
	editRow += `<td><input type="number" placeholder="Number" step="1" min="0" class="form-control" id="tblInputStock-${component.id}" value="${component.stock}"></td>`;
	editRow += `<td><input type="url" placeholder="URL" class="form-control" id="tblInputDetails-${component.id}" value="${component.details}"></td>`;
	editRow += `<td><button type="button" class="btn btn-warning btn-sm" onclick="clickCancelEdit(${component.id})"><i class="fa-solid fa-xmark" style="color: white;"></i></button></td>`;

	document.querySelector(`[data-p-id=component-id-${component.id}]`).innerHTML = editRow;

	document.getElementById(`tblInputCategory-${component.id}`).value = component.category;
	document.getElementById(`tblInputManufacturer-${component.id}`).value = component.manufacturer;
	document.getElementById(`tblInputColor-${component.id}`).value = component.color;
};

//canceling changes to components when editing
let clickCancelEdit = function (id) {
	let component = arrayOfComponents.find((i) => i.id === id);
	let editRow = "";

	editRow += `<td><button type="button" class="btn btn-secondary btn-sm" onclick="clickEditComponent(${component.id})"><i class="fa-solid fa-pen-to-square"></i></button></td>`;
	editRow += `<td>${component.serial}</td>`;
	editRow += `<td>${component.price}€</td>`;
	editRow += `<td>${component.category}</td>`;
	editRow += `<td>${component.manufacturer}</td>`;
	editRow += `<td>${component.model}</td>`;
	editRow += `<td>${component.color}</td>`;
	editRow += `<td><img src="${component.photo}" style="height: 75px; width: 75px; object-fit: cover;"></td>`;
	editRow += `<td>${component.stock}</td>`;
	editRow += `<td><a href="${component.details}"><button type="button" class="btn btn-info btn-sm"><i class="fa-solid fa-circle-info" style="color: white;"></i></button></a></td>`;
	editRow += `<td><button type="button" class="btn btn-danger btn-sm" onclick="clickDeleteComponent(${component.id})"><i class="fa-solid fa-trash"></i></button></td>`;

	document.querySelector(`[data-p-id=component-id-${component.id}]`).innerHTML =
		editRow;
};
//to accept changes made to a component
let clickUpdateComponent = function (id) {
	let component = arrayOfComponents.find((i) => i.id === id);

	component.serial = document.getElementById(`tblInputSerial-${id}`).value;
	component.price = document.getElementById(`tblInputPrice-${id}`).value;
	component.category = document.getElementById(`tblInputCategory-${id}`).value;
	component.manufacturer = document.getElementById(`tblInputManufacturer-${id}`).value;
	component.model = document.getElementById(`tblInputModel-${id}`).value;
	component.color = document.getElementById(`tblInputColor-${id}`).value;
	component.photo = document.getElementById(`tblInputPhoto-${id}`).value;
	component.stock = document.getElementById(`tblInputStock-${id}`).value;
	component.details = document.getElementById(`tblInputDetails-${id}`).value;

	let xhttp = new XMLHttpRequest();

	xhttp.open("POST", "http://localhost:3000/updateComponent", true);
	xhttp.setRequestHeader("Content-type", "application/json;charset=UTF-8");
	xhttp.send(JSON.stringify(component));

	clickCancelEdit(id);
};

// delet components
let clickDeleteComponent = function (id) {
	deleteComponent(id);
};

//add components
let clickAddComponent = function () {
	let serial = document.getElementById("inputSerial").value;
	let price = document.getElementById("inputPrice").value;
	let category = document.getElementById("inputCategory").value;
	let manufacturer = document.getElementById("inputManufacturer").value;
	let model = document.getElementById("inputModel").value;
	let color = document.getElementById("inputColor").value;
	let photo = document.getElementById("inputPhoto").value;
	let stock = document.getElementById("inputStock").value;
	let details = document.getElementById("inputDetails").value;

	insertComponent({
		serial: serial,
		price: price,
		category: category,
		manufacturer: manufacturer,
		model: model,
		color: color,
		photo: photo,
		stock: stock,
		details: details,
	});

	document.getElementById("inputSerial").value = "";
	document.getElementById("inputPrice").value = 0;
	document.getElementById("inputCategory").value = "Select Category";
	document.getElementById("inputManufacturer").value = "Select Manufacturer";
	document.getElementById("inputModel").value = "";
	document.getElementById("inputColor").value = "None";
	document.getElementById("inputPhoto").value = "";
	document.getElementById("inputStock").value = 0;
	document.getElementById("inputDetails").value = "";
};

//this ensures that when the website is completly loaded and is ready to be manipulated and interacted with, the event lister will execute the 'getComponents' function.
document.addEventListener("DOMContentLoaded", () => {
	getComponents();
});