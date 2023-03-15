<template>
  <div>
    <el-table :data="tableData" style="width: 100%">
      <el-table-column label="资源名" width="180">
        <template #default="scope">
          <div style="display: flex; align-items: center">
            <el-icon><timer /></el-icon>
            <span style="margin-left: 10px">{{ scope.row.resourceName }}</span>
          </div>
        </template>
      </el-table-column>
      
      <el-table-column label="操作">
        <template #default="scope">
          <el-button size="small" @click="handleEdit(scope.$index, scope.row)">详情</el-button>
        </template>
      </el-table-column>
    </el-table>
  </div>
</template>

<script setup>
import { useRouter } from "vue-router";
import { ref, watch } from "vue";

let router = useRouter();

let tableData = ref([]);
watch(
  () => router.currentRoute.value.path,
  async (newValue, oldValue) => {
    console.log("watch", newValue);
    let arr = newValue.split("/");
    let path = arr[arr.length - 1];
    console.log(path);
    //发送请求获取资源
    let res = await $axios.get(`/resource/queryType/${path}`);
    console.log(res.data);
    tableData.value = res.data.data;
  },
  { immediate: true }
);

let handleEdit = (index,row)=>{
    window.open(row.remotePath)
}
</script>

<style>
</style>