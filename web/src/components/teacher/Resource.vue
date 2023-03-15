<template>
    <div>
      <el-button type="primary" @click="addResource">新增</el-button>
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
            <el-button size="small" @click="handleDelete(scope.$index, scope.row)">删除</el-button>
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
      tableData.value = res.data.data;
    },
    { immediate: true }
  );
  
  let handleEdit = (index,row)=>{
      window.open(row.remotePath)
  }
  let handleDelete = async (index,row)=>{
    let res = await $axios.delete(`/resource/del/${row.id}`)
    tableData.value.pop(index)
    console.log(res.data);
    if (res.data.data) {
      alert('删除成功')
    }
  }
  let addResource = ()=>{
    router.push('/teacher/home/ResourceAdd')
  }
  </script>
  
  <style>
  </style>