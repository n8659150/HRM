<template>
  <div class="demo">
    <div class="scroll-list-wrap">
      <cube-scroll
        ref="scroll"
        :data="items"
      >
        <ul class="foods-wrapper">
          <li v-for="(food, $key) in goods" :key="$key" class="food-item border-1px">
            <div class="icon">
              <img width="57" height="57" :src="food.icon">
            </div>
            <div class="food-content">
              <h2 class="name">{{food.name}}</h2>
              <p class="description">{{food.description}}</p>
              <div class="extra">
                <span class="count">月售{{food.sellCount}}份</span>
                <span>好评率{{food.rating}}%</span>
              </div>
              <div class="price">
                <span class="now">￥{{food.price}}</span>
                <span class="old" v-show="food.oldPrice">￥{{food.oldPrice}}</span>
              </div>
            </div>
          </li>
        </ul>
      </cube-scroll>
    </div>
  </div>
</template>
<script>
import goodsData from '@/mock/goods-list.json'
let _foods = []
goodsData.goods.forEach(item => {
  _foods = _foods.concat(item.foods)
})
export default {
  name: "ResumeList",
  data() {
    return {
        goods: _foods
      }
  },
  methods: {}
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style>
.scroll-list-wrap {
    height: 90vh;
    border: 1px solid rgba(0,0,0,.1);
    border-radius: 5px;
    -webkit-transform: rotate(0deg);
    transform: rotate(0deg);
    overflow: hidden;
}
.foods-wrapper .food-item {
    display: -webkit-box;
    display: -webkit-flex;
    display: flex;
    padding: 18px;
    border-bottom: 1px solid rgba(7,17,27,.1);
}

.foods-wrapper .food-item .icon {
    -webkit-box-flex: 0;
    -webkit-flex: 0 0 57px;
    flex: 0 0 57px;
    margin-right: 10px; 
}
.foods-wrapper .food-item .food-content {
    flex: 1;
}

.foods-wrapper .food-item .food-content .name {
    margin: 2px 0 8px;
    height: 14px;
    line-height: 14px;
    font-size: 14px;
    color: #07111b;
}

.foods-wrapper .food-item .food-content .description {
    line-height: 12px;
    margin-bottom: 8px;
}

.foods-wrapper .food-item .food-content .description, .foods-wrapper .food-item .food-content .extra {
    line-height: 10px;
    font-size: 10px;
    color: #93999f;
}

.foods-wrapper .food-item .food-content .price {
    font-weight: 700;
    line-height: 24px;
}
</style>
