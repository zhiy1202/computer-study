<template>
  <div class="index-container">
    <el-container>
      <el-container>
        <el-aside class="aside">
          <el-menu
            default-active="2"
            class="el-menu-vertical-demo"
            @open="handleOpen"
            @close="handleClose"
            :router="true"
          >
            <el-sub-menu index="1">
              <template #title>
                <el-icon><location /></el-icon>
                <span>习题管理</span>
              </template>
              <el-menu-item-group>
                <el-menu-item index="/teacher/home/HomwWork">所有习题</el-menu-item>
              </el-menu-item-group>
              <el-menu-item-group title="留守儿童问题">
                <template #title><span>操作</span></template>
                <el-menu-item index="/teacher/home/HomwWorkAdd">发布</el-menu-item>
                <el-menu-item index="/teacher/home/UpdataWork">批阅</el-menu-item>
              </el-menu-item-group>
            </el-sub-menu>

            <el-sub-menu index="2">
              <template #title>
                <el-icon><location /></el-icon>
                <span>资源管理</span>
              </template>
              <el-menu-item-group>
                <template #title><span>分类</span></template>
                <template v-for="item in resourceType" :key="item.id">
                  <el-menu-item index="#" @click="goType(item.id)">{{
                    item.type
                  }}</el-menu-item>
                </template>
              </el-menu-item-group>
            </el-sub-menu>

            <el-menu-item index="/teacher/home/TeacherInfo">
              <el-icon><setting /></el-icon>
              <template #title>个人信息</template>
            </el-menu-item>
            <el-menu-item index="/teacher/home/Coment">
              <el-icon><setting /></el-icon>
              <template #title>学生留言</template>
            </el-menu-item>
            <el-menu-item @click="exit" index="/teacher">
              <el-icon><setting /></el-icon>
              <template #title>退出登录</template>
            </el-menu-item>
          </el-menu>
        </el-aside>

        <el-main>
          <router-view></router-view>
        </el-main>
      </el-container>
    </el-container>
  </div>
</template>

<script setup>
import { ref } from "vue";
import { useRouter } from "vue-router";
const router = useRouter();

const exit = ()=>{
  $axios.get('front/user/teacher/exit')
}
var resourceType = ref([])
const goType = (id)=>{
  router.push(`/teacher/home/Resource/${id}`);
}
const getData = async () => {
  let type = await $axios.get('/resourceType/all')
  resourceType.value = type.data.data
};
getData();
</script>

<style>
</style>