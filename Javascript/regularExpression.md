# .test()

To find the **"day"** word in the string **"I can code everyday"** use **/day/** expression without quote marks. For test regex use **.test()** method.


```javascript
const testStr = "I can code everyday";
const testRegex = /day/;

console.log(testRegex.test(testStr)); // true
```


If you want to match **dog or cat or bird** in the string use **/dog|cat|bird/**

```javascript
const pets = "I have a cat";
const petRegex = /cat|dog|bird/;
petRegex.test(petRegex); // true --> just return true
```

If you want ignore lowercase or uppercase use **i** flag.

```javascript
const caseString = "IstanBul";
const regString = /istanbul/i;
regString.test(caseString); // true
```


# .match()

**match()** syntax opposite to **.test()** syntax

```javascript
'string'.match(/regex/);
/regex/.test('string');
```

```javascript
let myStr = "Change the world";
let myRegex = /world/;
myStr.match(myRegex)  // ["world"]
```
```javascript
let twinkleStar = "Twinkle, twinkle, little star";
let starRegex = /Twinkle/gi;
let result = twinkleStar.match(starRegex); // ['Twinkle', 'twinkle']
```

The wildcard character --> **(.)**  --> match any character

```javascript
let exampleStr = "Let's have fun with regular expressions!";
let unRegex = /.un/;
let result = unRegex.test(exampleStr); // true
```

```javascript
let bigStr = "big";
let bagStr = "bag";
let bugStr = "bug";
let bogStr = "bog";
let bgRegex = /b[aiu]g/; // there are between b and g a,i,u can be.
bigStr.match(bgRegex); // true
```

```javascript
let batStr = "bat";
let matStr = "mat";
let bgRegex = /[a-e]at/; // before at can be characters between a and e.
batStr.match(bgRegex); // ["bat"]
matStr.match(bgRegex); // null
```

```javascript
let jennyStr = "Jenny8675309";
let myRegex = /[a-z0-9]/ig; // between a-z and 0-9
jennyStr.match(myRegex);
```