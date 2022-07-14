<!DOCTYPE html>

<html>

<body>

 

<h1>Display the <em>Value</em> of given key</h1>

 

<p id="obj"></p>

<p id="key"> </p>

<p id="value"></p>

 

<script>

 

const input_key = prompt("Enter the key ")

var text =  '{"a":"1","b":{"c":{"f":"d"}}}';//'{"a":{"b":{"c":"d"}}}'; //'{"a":"1","b":{"c":"d"}}';

 

var x = myFunction(text, input_key);

myArray.ForEach(myFunction);

 

function myFunction(text, input_key){

const search = '/';

const searchRegExp = new RegExp(search, 'g');

const replaceWith = ',';

const result = input_key.replace(searchRegExp, replaceWith);

const myArray = result.split(",");

var fValue;

var fKey= myArray[(myArray.length-1)];

var obj = JSON.parse(text, function (key, value) {

 

if (key == fKey) {  

    fValue =value;

    return {value, done:true};

  } else {

        return value;

  }

 

});

 

document.getElementById("obj").innerHTML = "Object :" + text;

document.getElementById("key").innerHTML = "Key :" + input_key;

document.getElementById("value").innerHTML = "Value :"+ fValue.toUpperCase() ;

}

</script>

 

</body>

</html>
