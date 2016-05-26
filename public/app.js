function something()
{
	var x = window.localStorage.getItem('aaa'); // hh['aaa'] = x

	x = x * 1 + 1; // x = x + 1

	window.localStorage.setItem('aaa', x); // hh['aaa'] = x

	alert(x);
}

function add_to_cart(id)
{
	var key = 'product_' + id;

	var x = window.localStorage.getItem(key);
		x = x * 1 + 1;
	window.localStorage.setItem(key, x);

	alert('Items in your Cart: ' + cart_get_number_of_items());
}

function cart_get_number_of_items()
{
	var cnt = 0
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
