## Most Used Javascript Methods 

# .map()

.map() aldığı listenin her elemanını belirtilen işleme sokar ve yine bir liste döndürür.

```javascript
const array1 = [1, 2, 3, 4, 5];
const map1 = array1.map(x => x * 2);

console.log(map1);
// Output: Array [2, 4, 6, 8, 10]
```

Using map to reformat objects in an array

```javascript
const kvArray = [
  { key: 1, value: 10 },
  { key: 2, value: 20 },
  { key: 3, value: 30 },
];

const reformattedArray = kvArray.map(({ key, value }) => ({ [key]: value }));

console.log(reformattedArray); 
// [{ 1: 10 }, { 2: 20 }, { 3: 30 }]



const map3 = kvArray.map(obj => {
const newObj = {};
newObj[obj.key] = obj.value;
return newObj;
});

console.log(map3)
// [{ 1: 10 }, { 2: 20 }, { 3: 30 }]
```

# .filter()

filter() aldığı dizinin elemanlarının içerisinden belirtilen koşulu sağlayan elemanları alır ve bu elemanlardan oluşan yeni bir dizi döndürür.

```javascript
const words = ['limit', 'elite', 'exuberant', 'destruction'];
const result = words.filter(word => word.length > 6)
console.log(result)
// ["exuberant", "destruction"]
```

