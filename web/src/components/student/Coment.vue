<template>
  <div>
    <el-form
      ref="ruleFormRef"
      :model="ruleForm"
      status-icon
      :rules="rules"
      label-width="120px"
      class="demo-ruleForm"
    >
      <el-form-item label="老师名" prop="pass">
        <el-input v-model="ruleForm.teacherName" type="text" autocomplete="off" />
      </el-form-item>
      <el-form-item label="问题" prop="checkPass">
        <el-input
          v-model="ruleForm.content"
          type="text"
          autocomplete="off"
        />
      </el-form-item>
      <el-form-item>
        <el-button type="primary" @click="submitForm()"
          >发送</el-button
        >
      </el-form-item>
    </el-form>
  </div>
</template>

<script setup>
import { ref } from "vue";

let ruleForm = ref({})
let submitForm = async ()=>{
    console.log(ruleForm.value);
    let fromData = new FormData()
    fromData.append('teacherName',ruleForm.value.teacherName)
    fromData.append('content',ruleForm.value.content)
    let res = await $axios.post(`/coment/add`,fromData)
    console.log(res.data);
    if (res.data.data) {
        alert(res.data.message)
    }else{
        alert(res.data.message)
    }
}
</script>

<style>
</style>