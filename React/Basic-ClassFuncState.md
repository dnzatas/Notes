

## Class Component
```javascript

import React from 'react';

/*
Bu kısım eğer Componentimizi class şeklinde yazarsak state değişimini nasıl yaparız örneği.
Tüm işlemler bu componentin içinde halloluyor.
*/

class Counter extends React.Component {
    state = {
        counter: 0
    }
    increaseCount = () => {
        this.setState({
            counter: this.state.counter + 1
        })
    }
    render(){
        return(
            <div>
                <h1>{this.state.counter}</h1>
                <button className='btn btn-outline-danger' onClick={this.increaseCount}>Increase</button>
            </div>
        );
    }
}

export default Counter;

```


## Function Component
```javascript
import React from 'react';

/*
Bu kısım eğer Componentimizi function şeklinde yazarsak state değişimini nasıl yaparız örneği.
Eski Yaklaşım.
Eski yapıda, fonksiyon componentte state kullanılmadığı için değişecek bilgiyi ana component olan
App componentinde tanımlarız.
*/


// App Componenti
import Counter from './Counter';

class App extends React.Component {
state = {
counter: 0
};

increaseCount = () => {
        this.setState({
            counter: this.state.counter + 1
        })
};

render(){
return(
<div className="row">
                <Counter
                increaseCount = {this.increaseCount}
                    counter = {this.state.counter} />
            </div>
);
}

}

// Counter Componenti
const Counter = (props) => {
    return(
        <div>
            <h1>{props.counter}</h1>
            <button className='btn btn-outline-danger' onClick={props.increaseCount}>Increase</button>
        </div>
    );
}

export default Counter;
```


## useState

```javascript
import Counter from './Counter';

/*
Bu kısım useState kullanarak yaptığımız counter örneği.
Yeni Yaklaşım. Tüm işlemler bu componentin içinde oluyor.
*/

import {useState} from 'react';

const Counter = () => {
    const [counter, setCounter] = useState(0);

    const handleClick = () => {
        setCounter(counter+1);
    }
   
    return(
        <div>
            <h1>{counter}</h1>
            <button className='btn btn-info' onClick={handleClick}>Increase</button>
            {/*<button className='btn btn-info' onClick={() => setCounter(counter+1)}>Increase</button> */  /* bu yöntem daha kısa */}
        </div>
    );
}

export default Counter;
```