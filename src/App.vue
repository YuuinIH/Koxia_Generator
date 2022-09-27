<script setup lang="ts">
import koxia from "../koxia.json";
import { ref } from "vue";
const timeList = koxia.time;
const foodList = koxia.food;
const sentenceList = koxia.sentence;

const getKoxia = (...Str: string[]) => {
  return `
  こんしや💫${Str[0]}安sensei～
  今日${Str[1]}餐是✧⁺⸜${Str[2]}⸝⁺✧
  ${Str[3]}，${Str[4]}！
  ${Str[5]}，${Str[6]}！！
  `;
};

const RandomKoxia = () => {
  const nowtime = new Date();
  const time = nowtime.getHours();
  const timestr =
    time < 12 ? timeList[0] : time < 18 ? timeList[1] : timeList[2];
  const foodstr = foodList[Math.floor(Math.random() * foodList.length)];
  //get 4 random array elements
  const sentencestr = sentenceList.sort(() => Math.random() - 0.5).slice(0, 4);
  return getKoxia(timestr, timestr, foodstr, ...sentencestr);
};

const KoxiaStr = ref<string>(RandomKoxia());
</script>

<template>
  <el-row justify="center">
    <el-col :span="12">
      <el-container>
        <el-header>
          <h1>Koxia Generator</h1>
        </el-header>
        <el-main>
          <p>こんしや~在梦境中寻找魔法💫</p>
          <p>吾乃☆神崎·主天使·S·恋之诗夜·koxia·生成器☆</p>
          <p>只要按下生成 就会产生新的こんしや啦！</p>
          <p>不要忘记关注<a target="_blank" rel="noopener noreferrer nofollow" href="https://space.bilibili.com/690608690/">☆神崎·主天使·S·恋之诗夜·koxia☆</a>哦！</p>
          <el-card>
            <el-button @click="KoxiaStr = RandomKoxia()">生成</el-button>
            <el-input v-model="KoxiaStr" type="textarea" :rows="10" readonly />
          </el-card>
        </el-main>
      </el-container>
    </el-col>
  </el-row>
</template>

<style scoped></style>
