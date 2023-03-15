<template>
  <div class="demo-collapse">
    <el-collapse v-model="activeName" accordion>
      <template v-for="item in tableData" :key="item.p1.id">
        <el-collapse-item :title="item.p3.username" name="1">
            <el-input v-model="ruleForm.content" placeholder="回复内容"></el-input>
            <el-button @click="back(item.p3.id,item.p1.id)">回复</el-button>
          <template v-for="c in item.p2" :key="c.id">
            <div>
              {{ c.content }}
            </div>
          </template>
        </el-collapse-item>
      </template>
    </el-collapse>
  </div>
</template>

<script setup>
import { ref } from "vue";

const activeName = ref("1");
const ruleForm = ref({
    content:''
})

let tableData = ref([]);
const back = async (getId,comentRelationId)=>{
    console.log(getId,comentRelationId,ruleForm.value.content);
    let formData = new FormData()
    formData.append("getId",getId);
    formData.append("comentRelationId",comentRelationId);
    formData.append("content",ruleForm.value.content);
    let res = await $axios.post('/coment/back',formData)
    console.log(res.data);
    if (res.data.data) {
        alert(res.data.message)
        getData()
    }

}
const getData = async () => {
  let res = await $axios.get("/coment/allComent");
  console.log(res.data);
  tableData.value = res.data.data;
};
getData();
</script>

<style>
</style>