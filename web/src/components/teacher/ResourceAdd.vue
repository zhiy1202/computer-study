<template>
  <div class="container">
    <div class="bar">
      <el-form
        ref="ruleFormRef"
        :model="ruleForm"
        status-icon
        label-width="120px"
        class="demo-ruleForm"
      >
        <el-form-item label="资源名" prop="pass">
          <el-input
            v-model="ruleForm.resourceName"
            type="text"
            autocomplete="off"
          />
        </el-form-item>
        <el-form-item label="分类" prop="age">
          <el-select
            v-model.number="ruleForm.resourceType"
            placeholder="Select"
          >
            <el-option
              v-for="item in arr"
              :key="item.id"
              :label="item.type"
              :value="item.id"
            />
          </el-select>
        </el-form-item>
        <el-upload
          v-model:file-list="fileList"
          class="upload-demo"
          action="https://run.mocky.io/v3/9d059bf9-4660-45f2-925d-ce80ad6c4d15"
          :on-remove="handleRemove"
          list-type="picture"
          :before-upload="beforeUpload"
          :http-request="upload"
        >
          <el-button type="primary">图片上传</el-button>
          <template #tip> </template>
        </el-upload>
        <el-form-item>
          <el-button @click="register">添加</el-button>
        </el-form-item>
      </el-form>
    </div>
  </div>
</template>
    
    <script setup>
import { ref } from "vue";
import { useRouter } from "vue-router";

var ruleForm = ref({
  resourceName: "",
  resourceType: "",
  file:{}
});
const beforeUpload = (file)=>{
    ruleForm.value.file = file
}
const handleRemove = (uploadFile, uploadFiles) => {
  console.log(uploadFile, uploadFiles)
}

const upload = (file)=>{
  console.log(file);
}


const router = useRouter();
var arr = ref([]);
const getData = async () => {
  let type = await $axios.get("/resourceType/all");
  arr.value = type.data.data;
};
getData();

const register = async () => {
  let formData = new FormData();
  formData.append("resourceName", ruleForm.value.resourceName);
  formData.append("type", ruleForm.value.resourceType);
  formData.append("file", ruleForm.value.file);
  let result = await $axios.post(`/resource/add`, formData);
  console.log(result);
  if (result.data.data) {
    alert(result.data.message);
  } else {
    alert(result.data.message);
  }
};
</script>
    
    <style scoped>
/* .container {
  background-image: url("../../assets/1.jpg");
  background-repeat: no-repeat;
  background-size: 100% 100%;
  padding: 1px;
} */
.bar {
  width: 50%;
  height: 500px;
  margin: 20% auto;
}
</style>