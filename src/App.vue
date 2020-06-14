<template>
<v-app id="inspire">
    <v-container fluid class="jumbotron d-flex align-center aaa">
        <v-btn v-scroll="onScroll" v-show="fab" fab dark fixed bottom right color="white" @click="toTop">
            <v-icon large color="#1A202C">mdi-chevron-up</v-icon>
        </v-btn>
        <div style="width: 100%">
            <v-row class="mb-12" align="center">
                <v-col cols="12" md="6">
                    <div :class="{'d-flex justify-center': $vuetify.breakpoint.smAndDown, 'd-flex justify-end mr-12 pr-12': $vuetify.breakpoint.mdAndUp}">
                        <v-avatar size="400">
                            <v-img :src="getImgUrl(info.avatar)" />
                        </v-avatar>
                    </div>
                </v-col>
                <v-col cols="12" md="5">
                    <div :class="{'d-flex justify-center text-center': $vuetify.breakpoint.smAndDown, 'd-flex ml-12 fill-height align-center': $vuetify.breakpoint.mdAndUp}">
                        <div>
                            <div>
                                <span class="display-4">
                                    {{ info.name }}
                                </span>
                            </div>
                            <div class="my-5">
                                <span class="title mt-5">
                                    {{ info.description }}
                                </span>
                            </div>
                            <div class="my-5">
                                <span class="display-1 cursor-pointer" @click.stop="openResume">
                                    <v-icon large class="mb-1">mdi-file-document-outline</v-icon>
                                    Resume
                                </span>
                            </div>
                        </div>
                    </div>
                </v-col>
            </v-row>
            <v-row class="link-bar">
                <v-col class="text-center" cols="12" md="3">
                    <span @click.stop="scrollTo('work-experience')" class="display-1 link-item">
                        <v-icon large class="mb-1">mdi-briefcase</v-icon>
                        Work Experience
                    </span>
                </v-col>
                <v-col class="text-center" cols="12" md="3">
                    <span @click.stop="scrollTo('personal-projects')" class="display-1 link-item">
                        <v-icon large class="mb-1">mdi-code-braces</v-icon>
                        Personal Projects
                    </span>
                </v-col>
                <v-col class="text-center" cols="12" md="3">
                    <span @click.stop="scrollTo('tools-and-frameworks')" class="display-1 link-item">
                        <v-icon large class="mb-1">mdi-hammer-wrench</v-icon>
                        Technologies
                    </span>
                </v-col>
                <v-col class="text-center" cols="12" md="3">
                    <span @click.stop="scrollTo('social-media')" class="display-1 link-item">
                        <v-icon large class="mb-1">mdi-account-box</v-icon>
                        Social Media
                    </span>
                </v-col>
            </v-row>
        </div>
    </v-container>

    <v-container fluid class="dark-background" id="work-experience">
        <v-row justify="center">
            <div class="my-12 mx-12 text-center">
                <span class="display-3">
                    Work Experience
                </span>
            </div>
        </v-row>

        <v-row v-for="(experience, index) in info.workEperiences" :key="index" class="my-12" justify="center">
            <v-card color="#1A202C" :width="squareWidth">
                <div :class="{'d-flex flex-column': $vuetify.breakpoint.mdAndDown, 'd-flex flex-no-wrap': $vuetify.breakpoint.lgAndUp}" style="width: 100%">
                    <a :href="experience.link" target="_blank">
                        <v-avatar class="flex-shrink-0" height="350" width="400" tile>
                            <v-img :src="getImgUrl(experience.image)"></v-img>
                        </v-avatar>
                    </a>
                    <div class="ma-12">
                        <div class="mb-5">
                            <span class="display-1">
                                {{ experience.employer }} - {{ experience.position }}
                            </span>
                        </div>
                        <div v-for="(description, index) in experience.descriptionList" :key="index" class="mb-1">
                            <span class="title">
                                - {{ description }}
                            </span>
                        </div>
                    </div>
                </div>
            </v-card>
        </v-row>
    </v-container>

    <v-container fluid class="light-background" id="personal-projects">
        <v-row justify="center">
            <div class="my-12 mx-12 text-center">
                <span class="display-3">
                    Personal Projects
                </span>
            </div>
        </v-row>
        <div v-for="(project, index) in info.personalProjects" :key="index">
            <v-row v-if="index % 2 == 0" justify="center">
                <v-col cols="12" lg="5" class="pa-12">
                    <div class="fill-height pa-5">
                        <v-card shaped class="fill-height pa-5" color="#1A202C">
                            <div class="mb-12 mx-12 text-center">
                                <span class="display-1">
                                    {{ project.name }}
                                </span>
                            </div>
                            <div v-for="(description, index) in project.descriptionList" :key="index">
                                <span class="title">
                                    - {{ description }}
                                </span>
                            </div>
                        </v-card>
                    </div>
                </v-col>
                <v-col cols="12" lg="5" class="pa-12">
                    <v-img :aspect-ratio="16/9" :src="getImgUrl(project.image)" class=""></v-img>
                </v-col>
            </v-row>
            <v-row v-if="index % 2 == 1" justify="center">
                <v-col cols="12" lg="5" class="pa-12">
                    <v-img :aspect-ratio="16/9" :src="getImgUrl(project.image)" class=""></v-img>
                </v-col>
                <v-col cols="12" lg="5" class="pa-12">
                    <div class="fill-height pa-5">
                        <v-card shaped class="fill-height pa-5" color="#1A202C">
                            <div class="mb-12 mx-12 text-center">
                                <span class="display-1">
                                    {{ project.name }}
                                </span>
                            </div>
                            <div v-for="(description, index) in project.descriptionList" :key="index">
                                <span class="title">
                                    - {{ description }}
                                </span>
                            </div>
                        </v-card>
                    </div>
                </v-col>

            </v-row>
        </div>

    </v-container>
    <v-container fluid class="dark-background" id="tools-and-frameworks">
        <v-row justify="center">
            <div class="my-12 mx-12 text-center">
                <span class="display-3">
                    Technologies
                </span>
            </div>
        </v-row>

        <v-row no-gutters>
            <v-col v-for="(tool, index) in info.toolsAndFrameworks" :key="index" cols="12" sm="6" md="4" lg="3">
                <div class="d-flex flex-column align-center my-5">
                    <v-avatar size="250" tile>
                        <v-img :src="getImgUrl(tool.image)" contain></v-img>
                    </v-avatar>
                    <span class="display-1">
                        {{ tool.name }}
                    </span>
                </div>
            </v-col>
        </v-row>
    </v-container>

    <v-container fluid class="light-background">
        <v-row class="light-background" id="social-media" align="center">
            <v-col cols="12" md="4">
                <div class="d-flex justify-center ma-5">
                    <v-tooltip top>
                        <template v-slot:activator="{ on }">
                            <a :href="info.linkedin.link" v-on="on" target="_blank">
                                <v-avatar size="300" tile>
                                    <v-img :src="getImgUrl(info.linkedin.image)"></v-img>
                                </v-avatar>
                            </a>
                        </template>
                        <span>{{ info.linkedin.link }} </span>
                    </v-tooltip>

                </div>
            </v-col>
            <v-col cols="12" md="4">
                <div class="d-flex justify-center ma-5">
                    <v-tooltip top>
                        <template v-slot:activator="{ on }">
                            <a :href="info.github.link" v-on="on" target="_blank">
                                <v-avatar size="300" tile>
                                    <v-img :src="getImgUrl(info.github.image)"></v-img>
                                </v-avatar>
                            </a>
                        </template>
                        <span>{{ info.github.link }} </span>
                    </v-tooltip>

                </div>
            </v-col>
            <v-col cols="12" md="4">
                <div class="d-flex justify-center ma-5">
                    <v-tooltip top>
                        <template v-slot:activator="{ on }">
                            <a :href="info.email.link" v-on="on" target="_blank">
                                <v-avatar size="300" tile @click.stop="copyEmailToClipboard">
                                    <v-img :src="getImgUrl(info.email.image)"></v-img>
                                </v-avatar>
                            </a>
                        </template>
                        <span>{{ info.email.email }} </span>
                    </v-tooltip>

                </div>
            </v-col>

        </v-row>
    </v-container>

</v-app>
</template>

<script>
export default {

    data: () => ({
        fab: false,
        info: {
            avatar: "picture-of-me.jpeg",
            name: "Nicholas Paz",
            description: "DevOps engineer interested in automation and CI/CD. Passionate about learning new technologies and solving complex problems.",
            resume: "resume.pdf",
            workEperiences: [{
                employer: "Teradata",
                position: "Software Engineer Intern",
                startDate: "",
                endDate: "",
                descriptionList: [
                    "Planned internship focusing on CI/CD and automation.",
                ],
                image: 'teradata.jpg',
                link: "https://www.teradata.com/",
            }, {
                employer: "Treeline Interactive",
                position: "Software Engineer Intern",
                startDate: "",
                endDate: "",
                descriptionList: [
                    "Built CI/CD pipelines with Jenkins and Capistrano",
                    "Developed full stack applications with Django, Laravel, and Vue.js",
                    "Automated database management processes with SQL",
                    "Assumed full ownership of developing and deploying internal tools",
                    "Created automated firmware tests with Python, Bash, and Ansible",
                    "Programmed microcontrollers in C++",
                ],
                image: 'treeline.png',
                link: "https://treelineinteractive.com/",
            }, {
                employer: "UCSD E4E SmartFin",
                position: "Student Researcher",
                startDate: "",
                endDate: "",
                descriptionList: [
                    "Used machine learning models to classify IMU sensor data",
                    "Generated, processed, and visualized training and test data"
                ],
                image: 'smartfin-white.png',
                link: "https://smartfin.org/",
            }, {
                employer: "Boeing",
                position: "Software Engineer Intern",
                startDate: "",
                endDate: "",
                descriptionList: [
                    "Learned about Agile and the software development cycle",
                    "Used Java to create an internal tool for visualizing data",
                ],
                image: 'boeing.png',
                link: "https://www.boeing.com/",
            }],
            personalProjects: [{
                name: "Kan.sh",
                descriptionList: [
                    "Serverless Kanban Board",
                    "concurrent editing"
                ],
                link: "https://www.kan.sh",
                code: "github.com/nickmpaz/kan.sh",
                image: "kan-sh.png",
            }, {
                name: "Blogformation.net",
                descriptionList: [
                    "Generate a code-style blog from your project's git repository",
                    "serverless"
                ],
                link: "https://www.kan.sh",
                code: "github.com/nickmpaz/kan.sh",
                image: "blogformation.png",
            }],
            toolsAndFrameworks: [{
                image: "docker.png"
            }, {
                image: "terraform.svg"
            }, {
                image: "ansible.png"
            }, {
                image: "jenkins.png"
            }, {
                image: "cloudformation.png"
            }, {
                image: "laravel.png"
            }, {
                image: "django.png"
            }, {
                image: "vue.png"
            }, {
                image: "flask.png"
            }, {
                image: "serverless.png"
            }, {
                image: "githubactions.png"
            }, {
                image: "mysql.svg"
            }, {
                image: "postgresql.png"
            }, {
                image: "aws.png"
            }],
            linkedin: {
                link: "https://linkedin.com/in/nickmpaz",
                image: "linkedin.png"
            },
            github: {
                link: "https://github.com/nickmpaz",
                image: "github.svg",
            },
            email: {
                link: "mailto:nicholasmpaz@gmail.com",
                email: "nicholasmpaz@gmail.com",
                image: "email.png",
            }
        }

    }),
    computed: {
        squareWidth() {
            console.log(this.$vuetify.breakpoint.mdAndUp)
            return (this.$vuetify.breakpoint.lgAndUp ? "80%" : "400")
        }
    },
    methods: {
        onScroll(e) {
            if (typeof window === 'undefined') return
            const top = window.pageYOffset || e.target.scrollTop || 0
            this.fab = top > 20
        },
        toTop() {
            this.$vuetify.goTo(0)
        },
        scrollTo: function (id) {
            document.getElementById(id).scrollIntoView({
                behavior: 'smooth'
            });
        },
        getImgUrl: function (img) {
            var images = require.context('./assets/')
            return images('./' + img)
        },
        openResume: function () {
            window.open(this.info.resume, '_blank');
        }

    },
    created() {
        this.$vuetify.theme.dark = true
        console.log(this.$vuetify.breakpoint.mdAndUp)
    },
}
</script>

<style>
.jumbotron {
    min-height: 100vh;
    width: 100%;
    background: linear-gradient(45deg, #1A202C 0%, #1A202C 63%, #2D3748 63%, #2D3748 75%, #4A5568 75%, #4A5568 81%, #718096 81%, #718096 85%, #A0AEC0 85%, #A0AEC0 90%, #CBD5E0 90%, #CBD5E0 100%);
}

.dark-background {
    min-height: 100vh;
    width: 100%;
    background: #A0AEC0;
}

.light-background {
    min-height: 100vh;
    width: 100%;
    background: #CBD5E0;
}

.link-bar {
    margin-top: 8%;
}

.link-item {
    cursor: pointer;
}

.project-description {
    padding-left: 50px;
    padding-right: 50x;
    padding-top: 25px;
    padding-bottom: 25px;
}

.cursor-pointer {
    cursor: pointer;
}
</style>
