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
```javascript
let myRegex = /[^aeiou]/gi; // matches all characters that are not a vowel
```

```javascript
let word = "Mississippis";
let rgx = /s+/gi; // Change this line
let result = word.match(rgx); // ["ss", "ss", "s"]
```
```javascript
let soccerWord = "gooooooooal!";
let gPhrase = "gut feeling";
let oPhrase = "over the moon";
let goRegex = /go*/;
soccerWord.match(goRegex); // ["goooooooo"]
gPhrase.match(goRegex); // ["g"]
oPhrase.match(goRegex); // null
```

```javascript
let txt = "titanic";

let rgx = /t[a-z]*i/;
let res = txt.match(rgx) // ["titani"]

let rgx2 = /t[a-z]*?i/
let res2 = txt.match(rgx2) // ["ti"]
```

```javascript
let firstString = "Ricky is first and can be found.";
let firstRegex = /^Ricky/; // Nothing will happen before Ricky
firstRegex.test(firstString); // true
let notFirst = "You can't find Ricky now.";
firstRegex.test(notFirst); // false
```

```javascript
let theEnding = "This is a never ending story";
let storyRegex = /story$/; // Nothing will happen after story
storyRegex.test(theEnding);
```

```javascript
let longHand = /[A-Za-z0-9_]+/; 
let shortHand = /\w+/; // This is equal to [A-Za-z0-9_].
let oppShortHand = /\W/; // \W İS Opposite of the \w
```

```javascript
let spaceRegex = /\s/; // \s is for whitespace and [ \r\t\f\n\v] 
let spaceRegex = /\S/; // \S is opposite of whitespace
```