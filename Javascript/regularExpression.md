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
petRegex.test(petRegex); // true 
```

If you want ignore lowercase or uppercase use **i** flag.

```javascript
const caseString = "IstanBul";
const regString = /istanbul/i;
regString.test(caseString); // true
```