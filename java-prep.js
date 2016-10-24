function madLib(verb, adj, noun) {
  return `We shall ${verb.toUpperCase()} the ${adj.toUpperCase()} ${noun.toUpperCase()}.`
}
// a = madLib('make','best','guac')
// console.log(a);

function isSubstring(phrase, subphrase) {
  return phrase.includes(subphrase);
}
// console.log(isSubstring("time to program", "time"));

function fizzBuzz(array) {
  output = []
  array.forEach( el => {
    if((el % 3 === 0 && el % 5 !== 0 ) ||
      (el % 3 !== 0 && el % 5 === 0 ))
    output.push(el)
  });
  return output
}

// console.log(fizzBuzz([3,5,15]));


function isPrime(n) {
  if (n < 2) { return false; }
  for (let i = 2; i < n; i++) {
    if (n % i === 0) {return false; }
  }

  return true;
}
// console.log(isPrime(2));
// console.log(isPrime(10));
// console.log(isPrime(15485863));
// console.log(isPrime(3548563));

function sumofNprimes(n) {
  let sum = 0;
  let count = 0;
  for (let i = 2; count < n; i++ ) {
    if (isPrime(i)) {
      console.log(i);
      sum += i;
      count += 1;
     }
  }

  return sum;
}

// console.log(sumofNprimes(4));


function allOrNothing(mod, ...numbers) {
  for (let i = 0; i < numbers.length; i++) {
    if (numbers[i] % mod !== 0) {
      return false;
    }
  }

  return true;
}

// console.log(allOrNothing(5, 17, 25, 10));

//
// function titleize(names, callback) {
//   let titleized = names.map(name => `Mx. ${name} Jingleheimer Schmidt`);
//   callback(titleized);
// };
//
// titleize(["Mary", "Brian", "Leo"], (names) => {
//   names.forEach(name => console.log(name));
// });

function Elephant(name, height, tricks) {
  this.name = name;
  this.height = height;
  this.tricks = tricks;
}

Elephant.prototype.trumpet = function(){
  console.log(`${this.name} the elephant goes 'phrRRRRRRRRRRR!!!!!!!!'`);
}

Elephant.prototype.grow = function() {
  this.height += 12;
}

Elephant.prototype.addTrick = function(trick) {
  this.tricks.push(trick);
}

Elephant.prototype.play = function() {
  let idx = Math.floor(Math.random() * this.tricks.length);
  console.log(`${this.name} is ${this.tricks[idx]}!`);
}

// const elephant = new Elephant("Micah",0,["painting a picture"])

// console.log(elephant.tricks)

let ellie = new Elephant("Ellie", 185, ["giving human friends a ride", "playing hide and seek"]);
let charlie = new Elephant("Charlie", 200, ["painting pictures", "spraying water for a slip and slide"]);
let kate = new Elephant("Kate", 234, ["writing letters", "stealing peanuts"]);
let micah = new Elephant("Micah", 143, ["trotting", "playing tic tac toe", "doing elephant ballet"]);

let herd = [ellie, charlie, kate, micah];

Elephant.paradeHelper = function (elephant) {
  console.log(`${elephant.name} is trotting by!`);
};

// herd.forEach(elephant => Elephant.paradeHelper(elephant))

function dinerBreakfast() {
  let order = "I'd like eggs please.";
  console.log(order);

  return function (food) {
    order = `${order.slice(0,order.length - 8)} and ${food} please.`
    console.log(order);
  };

};


// let bfastOrder = dinerBreakfast()
// bfastOrder("ham")
//
// bfastOrder("pig bacon")

function celebrityName (firstName) {
var nameIntro = "This celebrity is ";
function lastName (theLastName) {
return nameIntro + firstName + " " + theLastName;
}
return lastName;
}
var mjName = celebrityName ("Michael");
// console.log(mjName ("Jackson"))

Array.prototype.uniq = function () {
  let uniqs = [];
  for (let i = 0; i < this.length; i++) {
    if (!uniqs.includes(this[i])) {
      uniqs.push(this[i]);
    }
  }

  return uniqs;
};

// console.log([1,1,1,7, 2, 1, 3, 3].uniq());

Array.prototype.twoSum = function () {
  let output = [];
  for (let i = 0; i < this.length; i++) {
    for (let j = (i + 1); j < this.length; j++) {
      if (this[i] + this[j] === 0) {
        output.push([i, j]);
      }
    }
  }

  return output;
};


Array.prototype.transpose = function () {
  let output = [];
  for (let i = 0; i < this.length; i++) {
    let row = []
    for (let j = 0; j < this.length; j++) {
      row.push(this[j][i]);
    }
    output.push(row);
  }

  return output;
};

let a = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8]
  ].transpose()

// console.log(a);

const NUMS = [1, 2, 3, 4, 5];

Array.prototype.myEach = function (func) {
  for (let i = 0; i < this.length; i++) {
    func(this[i]);
  }
  return this;
};

// [1, 2, 3, 4, 5].myEach((num) => {
//   console.log(`square of ${num} is ${num * num}`);
// });

Array.prototype.myMap = function (func) {
  let output = []
  this.myEach(el => {output.push(func(el))});
  return output;
};

// console.log(NUMS.myMap( num => num * num ));

Array.prototype.myInject = function (func) {
  let accum = this[0];
  this.slice(1).myEach(el => {accum = func(accum, el) });

  return accum;
};

// console.log(NUMS.myInject( (total, item) => total + item ));

Array.prototype.bubbleSort = function () {
  let sorted = false
  while(!sorted) {
    sorted = true;
    for (let i = 0; i < this.length; i++) {
      if (this[i] > this[i+1]) {
        let temp = this[i+1];
        this[i+1] = this[i];
        this[i] = temp;

        sorted = false;
      }
    }
  }

  return this;
};

// console.log([5, 3, 4, 2, 1].bubbleSort());

String.prototype.substrings = function () {
  let subs = [];
  for (let i = 0; i < this.length; i++) {
    for (var j = (i + 1); j <= this.length; j++) {
      if(!subs.includes(this.slice(i,j))) {
        subs.push(this.slice(i,j));
      }
    }
  }

  return subs;
};

// console.log("catca".substrings());

Function.prototype.myBind = function (ctx, ...bindArgs) {
  return (...callArgs) => {
    return this.apply(ctx,bindArgs.concat(callArgs))
  }
};

Function.prototype.curry = function (numArgs) {
  const args = [];
  let fn = this;
  function _curried(arg) {
    args.push(arg);
    if (args.length === numArgs) {
      return fn.apply(fn,args);
    } else {
      return _curried;
    }
  }

  return _curried;
};

function curriedSum(numArgs) {
  let numbers = []
  function _curriedSum(arg) {
    numbers.push(arg)
    if (numbers.length === numArgs) {
      let total = 0
      numbers.forEach(n => {
        total += n;
      })
      return total;
    } else {
      return _curriedSum;
    }
  }

  return curriedSum;
}
Function.prototype.curry2 = function(numArgs) {
  let args = []
  let fn = this

  function _curried(arg) {
    args.push(arg);
    if (args.length === numArgs) {
      return fn(...args)
    } else {
      _curried;
    }
  }

  return _curried;
}

function range(start, end) {
  if (end < start) {return []};
  return [start].concat(range(start + 1, end));
}

// console.log(range(0,5));

function sum(arr) {
  if (arr.length === 0) {return 0};
  let accum = arr[0];
  return accum += sum(arr.slice(1));
}

// console.log(sum([5,5,5,5]));

function fib(n) {
  if (n === 0) {
    return [];
  } else if (n === 1) {
    return [0];
  } else if (n === 2) {
    return [0, 1];
  }

  let output = [];

  return fib(n-1).concat([fib(n - 1)[fib(n - 1).length -1] + fib(n - 1)[fib(n - 1).length - 2]]);
}

Function.prototype.myCurry = function(numArgs) {
  let args = [];
  let fn = this
  function _curried(arg) {
    args.push(arg);
    if (args.length === numArgs) {
      return fn(...args)
    } else {
      return _curried
    }
  }

  return _curried

  Function.prototype.zeBind = function (ctx, ...args1) {
    return (...args2) => {
      return this.apply(ctx, args1.concat(args2))
    }
  };
}

function sumThree(num1, num2, num3) {
  return num1 + num2 + num3;
}

sumThree(4, 20, 6); // == 30

// you'll write `Function#curry`!
let f1 = sumThree.curry(3); // tells `f1` to wait until 3 arguments are given before running `sumThree`
f1 = f1(4); // [Function]
f1 = f1(20); // [Function]
f1 = f1(6); // = 30

sumThree.myCurry(3)(4)(20)(6)

Function.prototype.inherits = function (parent) {
  function Surrogat() {};
  Surrogate.prototype = parent.prototype;
  this.prototype = new Surrogate();
  this.prototype.constructor = this;
};


function bsearch(arr, target) {
  if (arr.length === 0 ) {return null};
  let mid = Math.floor(arr.length / 2)

  if (arr[mid] === target) {
    return mid;
  } else if (arr[mid] > target ) {
    return bsearch(arr.slice(0, mid), target)
  } else {
    let partial = bsearch(arr.slice(mid + 1), target)
    return (partial === null) ? null : (partial + mid + 1);
  }
}

// console.log(bsearch([1, 2, 3], 1))
// console.log(bsearch([2, 3, 4, 5], 3))
// console.log(bsearch([2, 4, 6, 8, 10], 6))
// console.log(bsearch([1, 3, 4, 5, 9], 5))
// console.log(bsearch([1, 2, 3, 4, 5, 6], 6))
// console.log(bsearch([1, 2, 3, 4, 5, 6], 0))
// console.log(bsearch([1, 2, 3, 4, 5, 7], 6))

function mergeSort(arr) {
  if (arr.length < 2) {return arr};

  let mid = Math.floor(arr.length / 2);
  let left = arr.slice(0,mid);
  let right = arr.slice(mid);
  let lefts = mergeSort(left)
  let rights = mergeSort(right)
  return merge(lefts ,rights);
}

function merge(left, right) {
  let sorted = []
  while (left.length > 0 && right.length > 0) {
    if (left[0] > right[0]) {
      sorted.push(right.shift());
    } else {
      sorted.push(left.shift());
    }
  }

  return sorted.concat(left).concat(right);
}

// console.log(mergeSort([4, 5, 2, 3, 1]))

function subsets(arr) {
  if (arr.length === 0) {return [[]]};

  let first = arr[0];
  let subs = subsets(arr.slice(1));
  let newSubs = subs.map( sub => sub.concat([first]));
  return subs.concat(newSubs);
}

// console.log(subsets([1,2,3]))


Function.prototype.curry3 = function (numArgs) {
  let args = []
  let fn = this
  function _curried(arg) {
    args.push(arg);
    if(args.length === numArgs) {
      return fn(...args)
    } else {
      return _curried
    }
  }

  return _curried
};

function fiber(n) {
  if (n === 1) {
    return 0;
  } else if (n === 2) {
    return [0, 1];
  }
let length = fiber(n - 1).length
  return fiber(n - 1).concat(fiber(n - 1)[length - 1] + fiber(n - 1)[length -2]);
}

// console.log(fiber(5))
