const S = "abppplee"
const D = ["able", "ale", "apple", "bale", "kangaroo"].sort();
const hash = {}
// search index position using binary search
// Manby O(log ary.length)
const bsearch = (ary, l, u, index) => {
  if (ary.length === 1 && ary[0] >= index) {
      return ary[0]
  }
  while(l <= u) {
    let m = Math.floor((u + l) / 2);
    //console.log(`${m}, ${ary[m]}, ${l}, ${u}, ${index}`)
    if(l===u && ary[m] > index) {
      return ary[m]
    }
    if (ary[m] > index) {
      if(m === 0) {
          return ary[m]
      }
      if(m-1 >= 0 && ary[m-1] <= index) {
        return ary[m]
      }
      u = m - 1;
    } else if(ary[m] <= index) {
      l = m + 1;
    }
  }
  return -1;
}

// preprocess for S
// O(S.length)
for(let i = 0 ;i < S.length;i++) {
  if(!Object.keys(hash).includes(S[i])) {
    hash[S[i]] = [i];
    continue;
  }
  hash[S[i]].push(i);
}
//  O(D.length * w.length * log(S.length))
for(w of D) {
  let lastMatchedIndex = -1;
  console.log(w)
  for(let i = 0;i < w.length;i++) {
    if(!Object.keys(hash).includes(w[i])) {
      break;
    }
    let index = hash[w[i]];
    //console.log(`${w[i]}: ${index}`);
    // need binary search
    lastMatchedIndex = bsearch(index, 0, index.length - 1, i)
    //console.log(`index: ${i}, lastMatchedIndex: ${lastMatchedIndex}`)
    if(i > lastMatchedIndex) {
      lastMatchedIndex = -1
      break;
    }
  }
  if (lastMatchedIndex !== -1) { 
    console.log(`${w} is subsequence of ${S}`)
  }
}
