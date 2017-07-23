// 列表去重
/* 
[input]  list = {1,2,2,2,3}
[output] list = {1,2,3}
*/
  HashSet set = new HashSet(list);
  list.clear();
  list.addAll(set);

/*
[input] aList = {1,2,3}; bList = {3,4,5}
[output] aList = {1,2,3,4,5}
*/
aList.removeAll(bList);
aList.addAll(bList);
