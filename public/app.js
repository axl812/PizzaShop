// function something()
// {
// 	var x = window.localStorage.getItem('aaa'); // hh['aaa'] = x

// 	x = x * 1 + 1; // x = x + 1
// 	window.localStorage.setItem('aaa', x); // hh['aaa'] = x
// 	alert(x);
// }

function add_to_cart(id)
{
	var key = 'product_' + id;

	var x = window.localStorage.getItem(key);
		x = x * 1 + 1;
	window.localStorage.setItem(key, x);

	// вывод кол-ва item's в корзине
	// alert('Items in your Cart: ' + cart_get_number_of_items());

	update_orders_input();
	update_orders_button();
}

function update_orders_input()
{
	var orders = cart_get_orders();
	$('#orders_input').val(orders);
}

function update_orders_button()
{
	var text = 'Cart (' + (cart_get_number_of_items() + ')');
	$('#orders_button').val(text);	
}

function cart_get_number_of_items()
{
	var cnt = 0;
	for(var i = 0; i < window.localStorage.length; i++) 
	{
		var key = window.localStorage.key(i); // получаем ключ
		var value = window.localStorage.getItem(key); // получаем значение по ключу hh[key] = x

	if(key.indexOf('product_') == 0)
		{
			cnt = cnt + value * 1;
		}
	}
	return cnt;
}

function cart_get_orders()
{
	var orders = '';
	for(var i = 0; i < window.localStorage.length; i++)
	{
		var key = window.localStorage.key(i); // получаем ключ
		var value = window.localStorage.getItem(key); // получаем значение по ключу hh[key] = x

	if(key.indexOf('product_') == 0)
		{
			orders = orders + key + '=' + value + ',';
		}
	}
	return orders;
}

function cancel_order()
{
	window.localStorage.clear();

	update_orders_input();
	update_orders_button();

	$('#cart').text('Your cart is now empty');

	return false;
}




// http://stackoverflow.com/questions/3231449/how-do-i-generate-a-thumbnail-client-side-in-a-modern-browser
// function getThumbnail(original, scale) 
// {
//   var canvas = document.createElement("canvas")

//   canvas.width = original.width * scale
//   canvas.height = original.height * scale

//   canvas.getContext("2d").drawImage
//     (original, 0, 0, canvas.width, canvas.height)

//   return canvas
// }

// var image = document.getElementsByTagName("img")[0]
// var thumbnail = getThubmnail(image, 1/5)

// document.body.appendChild(thumbnail)
