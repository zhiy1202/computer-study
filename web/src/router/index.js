import { createRouter, createWebHashHistory } from 'vue-router';



const routes = [
    {
        path: '/',
        redirect: '/student/login'
    },
    {
        path: '/student/login',
        component: () => import('../views/student/Login.vue')
    },
    {
        path: '/student/register',
        component: () => import('../views/student/Register.vue')
    },
    {
        path: '/student/home',
        component: () => import('../views/student/Index.vue'),
        children: [
            {
                path: '/student/home/UserInfo',
                component: () => import('../components/student/UserInfo.vue')
            },
            {
                path: '/student/home/StudentError',
                component: () => import('../components/student/StudentError.vue')
            },
            {
                path: '/student/home/StudentHomework/:id',
                component: () => import('../components/student/StudentHomework.vue')
            },
            {
                path: '/student/home/HomeWorkDetail',
                component: () => import('../components/student/HomeWorkDetail.vue')
            },
            {
                path: '/student/home/Resource/:id',
                component: () => import('../components/student/Resource.vue')
            },
            {
                path: '/student/home/Coment',
                component: () => import('../components/student/Coment.vue')
            },
            {
                path: '/student/home/ComentBack',
                component: () => import('../components/student/ComentBack.vue')
            },
        ]
    },
    {
        path: '/teacher',
        component: () => import('../views/teacher/Login.vue')
    },
    {
        path: '/teacher/login',
        component: () => import('../views/teacher/Login.vue')
    },
    {
        path: '/teacher/register',
        component: () => import('../views/teacher/Register.vue')
    },
    {
        path: '/teacher/home',
        component: () => import('../views/teacher/Index.vue'),
        children: [
            {
                path: '/teacher/home/HomwWork',
                component: () => import('../components/teacher/HomeWork.vue')
            },
            {
                path: '/teacher/home/HomwWorkAdd',
                component: () => import('../components/teacher/HomwWorkAdd.vue')
            },
            {
                path: '/teacher/home/TeacherInfo',
                component: () => import('../components/teacher/TeacherInfo.vue')
            },
            {
                path: '/teacher/home/UpdataWork',
                component: () => import('../components/teacher/UpdataWork.vue')
            },
            {
                path: '/teacher/home/UpdataWorkDetail',
                component: () => import('../components/teacher/UpdateWorkDetail.vue')
            },
            {
                path: '/teacher/home/Resource/:id',
                component: () => import('../components/teacher/Resource.vue')
            },
            {
                path: '/teacher/home/ResourceAdd',
                component: () => import('../components/teacher/ResourceAdd.vue')
            },
            {
                path: '/teacher/home/Coment',
                component: () => import('../components/teacher/Coment.vue')
            }
        ]
    },
    {
        path: '/admin',
        component: () => import('../views/admin/Login.vue')
    },
    {
        path: '/admin/login',
        component: () => import('../views/admin/Login.vue')
    },
    {
        path: '/admin/home',
        component: () => import('../views/admin/Index.vue'),
        children: [
            {
                path: '/admin/home/Student',
                component: () => import('../components/admin/Student.vue')
            },
            {
                path: '/admin/home/Teacher',
                component: () => import('../components/admin/Teacher.vue')
            },
            {
                path: '/admin/home/ClassRoom',
                component: () => import('../components/admin/ClassRoom.vue')
            },
            {
                path: '/admin/home/ClassRoomAdd',
                component: () => import('../components/admin/ClassRoomAdd.vue')
            },
            {
                path: '/admin/home/Subject',
                component: () => import('../components/admin/Subject.vue')
            },
            {
                path: '/admin/home/SubjectAdd',
                component: () => import('../components/admin/SubjectAdd.vue')
            }
        ]
    },
]

const router = createRouter(
    {
        history: createWebHashHistory(),
        routes: routes
    }
)

export default router