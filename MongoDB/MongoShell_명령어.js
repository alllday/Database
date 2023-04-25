db.createUser({
    user: "winner",
    pwd: "1234",
    roles :["readWrite", "dbAdmin"]
})

db.memo.find({}) //전체검색 
db.memo.count({}) //document count
db.memo.insertOne({
  "name": "apple",
  "age" : 100
})
db.memo.find({"name" : "apple"})
db.memo.find({"age" : 100})
db.createCollection("member")
db.member.stats()
db.member.insert({
  "name" : "hong2",
  "age" : 100,
  "tel" : "010"
})

show databases
db.createCollection("member")
show collections 
db.member.insertOne({"id":"hong", "pw":"1234", "name":"honggildong", "tel": "011"})
db.member.find({})
db.member.insertMany([
            {"id":"hong2", "pw":"1234", "name":"honggildong", "tel": "011"},
            {"id":"hong3", "pw":"1234", "name":"honggildong", "tel": "011"}
            ])
db.member.drop()
show collections
db.dropDatabase()
show dbs

db.memo.find({name: "Tom", office: "seoul"},{phone: 1}).count() //and조건 
db.memo.find({$or : [{name: "Tom"}, {office: "seoul"}]},{phone: 1}).count()
//{$or : [{조건키:값}, {조건키:값}]}

use shop9
db.memo.find({})     //전체 검색
db.memo.find({            //조건 검색 find({조건},{표시할 것})
    name : "Tom",
    office : "seoul"},{phone:1  }).count() //카운트는 조건 만족하는 documents 개수
   
db.memo.find({$or : [{name : "Tom"}, {office:"seoul"}]}, {phone:1}).count()  //{$or : [{조건 키: 값}, {조건 키 : 값}]
db.memo.find({office:"busan"},{_id:0, age:1,name:1,phone:1})
db.memo.find( {office: {$not: /busan/}}, {_id:0, age:1,name:1,phone:1}).limit(3)  // busan 이 아닌 것~ $not: /값/
                                                                                  // .limit() 제한하기~ 괄호 안의 숫자 만큼만 검색~
db.memo.deleteOne({office:"Wordware"}) // office가 Wordware 인 것 '하나'만 지움! 2개 있어도 하나만 지움!
db.memo.find({office:"Wordware"})
db.memo.updateMany({office:'seoul'},{$set: {phone : '999'}})   // updateMany({조건}, {$set : {바꿀 내용}})
db.memo.find({office:'seoul'},{phone:1}) //update 체크 성공!
db.memo.deleteMany({}) // 조건 안 주면 다 지워버림~

use shop9
db.getCollection("memo").find({})
// 1. office:Wordware인 사람의 age, phone 검색
db.memo.find({office : "Wordware"}, {age : 1, phone: 1})
// 2. age:1인 사람의 office, name 검색한 후 갯수 확인(count)
db.memo.find({age : 1},{office : 1, name : 1})
db.memo.find({age : 1},{office : 1, name : 1}).count()
// 3. age: 200, name:hong, office:busan, phone:011 추가
db.memo.insertOne({age: 200, name: "hong", office: "busan", phone: "011"})
//전체검색
db.memo.find({})
// 4. age가 2인 사람의 office를 seoul로 수정(1개의 document)
db.memo.updateOne({age: 2}, {$set: {office: "seoul"}})
// 5. age가 2이거나 office가 busan인 사람의 전체 목록 프린트
db.memo.find({$or : [{age : 2}, {office : "busan"}]})
// 6. age가 3인 사람의 document를 삭제후, age가 3인 사람을 검색
db.memo.deleteOne({age: 3})
db.memo.find({age: 3})
// 7. name이 Didi인 사람의 office를 ulsan으로 변경, name이 Didi인 사람 검색
db.memo.updateOne({name: "Didi"}, {$set: {office: "ulsan"}})
db.memo.find({name: "Didi"})
// 8. memo에 있는 사람 전체 삭제
db.memo.deleteMany({})
// 9. memo collection삭제후 전체 collections목록 프린트
db.memo.drop()
show collections