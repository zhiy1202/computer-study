<template>
  <div>
    <el-button @click="post">提交</el-button>
    <el-table :data="tableData" style="width: 100%">
      <el-table-column label="题目" width="180">
        <template #default="scope">
          <div style="display: flex; align-items: center">
            <el-icon><timer /></el-icon>
            <span style="margin-left: 10px">{{ scope.row.p2.title }}</span>
          </div>
        </template>
      </el-table-column>
      <el-table-column label="答案" width="180">
        <template #default="scope">
          <div style="display: flex; align-items: center">
            <el-icon><timer /></el-icon>
            <span style="margin-left: 10px">{{ scope.row.p2.answer }}</span>
          </div>
        </template>
      </el-table-column>
      <el-table-column label="分数" width="180">
        <template #default="scope">
          <div style="display: flex; align-items: center">
            <el-icon><timer /></el-icon>
            <span style="margin-left: 10px">{{ scope.row.p2.score }}</span>
          </div>
        </template>
      </el-table-column>
      <el-table-column label="学生作答" width="180">
        <template #default="scope">
          <div style="display: flex; align-items: center">
            <el-icon><timer /></el-icon>
            <span style="margin-left: 10px">{{ scope.row.p3.answer }}</span>
          </div>
        </template>
      </el-table-column>
      <el-table-column label="评分" width="180">
        <template #default="scope">
          <div style="display: flex; align-items: center">
            <el-icon><timer /></el-icon>
            <el-input v-model.number="scope.row.p3.score"></el-input>
          </div>
        </template>
      </el-table-column>
      <el-table-column label="评语" width="180">
        <template #default="scope">
          <div style="display: flex; align-items: center">
            <el-icon><timer /></el-icon>
            <el-input v-model="scope.row.p3.comment"></el-input>
          </div>
        </template>
      </el-table-column>
      <el-table-column label="操作">
        <template #default="scope">
          <el-button size="small" @click="handleEdit(scope.$index, scope.row)"
            >批阅</el-button
          >
        </template>
      </el-table-column>
    </el-table>
  </div>
</template>

<script setup>
import { ref } from "vue";
import { useRouter } from "vue-router"

let router = useRouter()
let tableData = ref([])
let arr = ref([])
let {userId,homeworkId} = router.currentRoute.value.query
console.log(userId,homeworkId);

let post = ()=>{
    console.log(arr.value);
    let homeWorkResults = JSON.stringify(arr.value)
    $axios.post(`/lookWork/addResult`,homeWorkResults,{
        headers: {
        'content-type': 'application/json'
    }
    }).then(res=>{
        console.log(res.data);
        if (res.data.data) {
            alert('批改成功')
        }
    })
}
const handleEdit = (index,row)=>{
    console.log(index,row);
    if (row.p3.score < row.p2.score) {
        row.p3.isTrue = false
    }else{
        row.p3.isTrue = true
    }
    let a = {
        comment:row.p3.comment,
        score:row.p3.score,
        homeworkId:row.p1.id,
        homeworkDetailId:row.p2.id,
        isTrue:row.p3.isTrue,
        answer:row.p3.answer,
        userId:row.p3.userId
    }
    arr.value.push(a)
}  

const getData = async ()=>{
    let res = await $axios.get(`/lookWork/UpdataWorkDetail/${userId}/${homeworkId}`)
    console.log(res.data);
    tableData.value = res.data.data
}
getData()
</script>

<style>
</style>