
string[] result;
string[] alphabet = ["a","b","c","d","e","f","g","h","i","j","k"
,"l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"];

type Bucket object {
   
    string[] items;
    int index;


    function sortBucket();

    public function addItem(string item) {
        self.items[lengthof self.items] = item;
    }
};

function Bucket::sortBucket() {
    map buckets = bucketize(self.items, self.index);
    addToResultArray(buckets);
}


    # Returns sorted string array after performing bucket sort repeatedly. 
    # Bydefault, sorting is done on the english alphabet order.
    # If any character outside the alphabet isfound, it will get the least priority in sorting.

    # + unsortedArray - The unsorted string array
    # + return - The sorted string arra
public function sort(string[] unsortedArray) returns string[] {
    result = [];
    Bucket initBucket = new Bucket();
    initBucket.items = unsortedArray;
    initBucket.index = 0;
    initBucket.sortBucket();
    return result;
}


# Returns sorted string array after performing bucket sort repeatedly on the given alphabet. 
# If any character outside the alphabet is found, it will get the least priority in sorting.

# + unsortedArray - The unsorted string array
# + newAlphabet - The vocabulary to do the sort
# + return - The sorted string array
public function sortForAlphabet(string[] unsortedArray, string[] newAlphabet) returns string[]{
    alphabet = newAlphabet;
    return sort(unsortedArray);
}

function bucketize(string[] strArray, int index) returns map {
    map bucketsMap;
    foreach item in strArray {
     addTobucket(item,index, bucketsMap);   
    }

    return bucketsMap;
}

function addTobucket(string item, int index, map bucketsMap){
    int nextIndex = index + 1;
    if (lengthof item < nextIndex) {
        //nothing to sort further, add to result
        result[lengthof result] = item;
    }

    boolean matchFound = false;
    foreach char in alphabet {  
        if (item.substring(index, nextIndex).equalsIgnoreCase(char)) {
            populateMap(bucketsMap, char, item, index);
            matchFound = true;
            break;
        }
    }
    
    //skip current character and consider next.
    if(!matchFound) {
        populateMap(bucketsMap, "nonAlp", item, index);
    }   
}

function populateMap(map bucketmap, string key, string item, int index){
    if(bucketmap.hasKey(key)) {
        Bucket buck = check <Bucket>bucketmap[key];
        buck.addItem(item);
        buck.index = index+1;
    } else {
        Bucket newBucket = new Bucket();
        newBucket.addItem(item);
        newBucket.index = index+1;
        bucketmap[key] = newBucket;
    }
}

function addToResultArray(map buckets) {
    int i = 0;
    
    while (i < lengthof alphabet) {
        string alpChar = alphabet[i];
        if (buckets.hasKey(alpChar)) {
            addToResultByKey(check <Bucket>buckets[alpChar]);
        }
        i++;
    }
    
    if (buckets.hasKey("nonAlp")) {
        addToResultByKey(check <Bucket>buckets["nonAlp"]);
    }
}

function addToResultByKey(Bucket thisBucket) {
    if (lengthof thisBucket.items > 1) {
            thisBucket.sortBucket(); //create buckets again
        } else {
            //only one item in the bucket
            result[lengthof result] = thisBucket.items[0];
        }
}