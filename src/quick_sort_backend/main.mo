import Array "mo:base/Array";

actor {
  public func qSort(arr : [Int]) : async [Int] {
    var newArr : [var Int] = Array.thaw(arr);
    sort(newArr, 0, newArr.size() - 1);
    return Array.freeze(newArr);
  };

  func sort(arr : [var Int], low : Nat, high : Nat) : () {
    if (low >= high) return;
    var position = partition(arr, low, high);
    if (position != 0) sort(arr, low, position - 1);
    sort(arr, position + 1, high);
  };

  func partition(arr : [var Int], low : Nat, high : Nat) : Nat {
    var pivot = arr[high];
    var index = low;
    var i = low;
    while (i < high) {
      if (arr[i] <= pivot) {
        var temp = arr[i];
        arr[i] := arr[index];
        arr[index] := temp;
        index := index + 1;
      };
      i := i + 1;
    };
    var temp = arr[index];
    arr[index] := arr[high];
    arr[high] := temp;
    return index;
  };
};

