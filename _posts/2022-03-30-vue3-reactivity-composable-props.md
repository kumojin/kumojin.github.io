---
layout: post
title:  "How to keep reactivity with a composable and a prop in Vue3"
author: "Camélie Groleau"
tags: 
  - javascript
  - vuejs
---
You install `Vue3` and you decide to use the `composable` and the `composition api`
to be faster and follow good practice, but something seems wrong and the destructured
constant from the composable doesn't update when your props update? I got you!
<!--more-->

Here is a simple example of the problem:

#### Composable

```js
import { computed } from 'vue';

export const useDropDown = (props) => {
  const isSelectedOption = computed(() =>
    props.options.map(option => option === props.selectedOption));

  return {
    isSelectedOption,
  };
};
```

#### View

```vuejs
<template>
  <button
    v-for="(option, idx) in options"
    :key="idx"
    @click="$emit('on-select', option)"
  >
    <div
      :class="{ 'selected-option': isSelectedOption[idx] }"
    >
      <div v-if="!!option.name">
        {{ option.name }}
      </div>

      <div v-html="option.address" />
    </div>

    <AppIcon
      v-if="isSelectedOption[idx]"
      dropdown
      icon-name="check"
    />
  </button>
</template>

<script setup>
import AppIcon from '@/components/app/AppIcon';

const emit = defineEmits(['on-select']);
const props = defineProps({
  options: {
    type: Array,
    required: true,
  },
  selectedOption: {
    type: Object,
    required: true,
  },
});

const { isSelectedOption } = useDropDown(props);
</script>
```

Everything seems good and it should work, right?
We use reactive props and a computed for a composable, so why does the value
of `isSelectedOption` never change?

Here's the answer: **The lifecycle hook**

The setup (composition api) is run before everything.
It takes the place of the `beforeCreated`/`Created` since they don't exist anymore.
So, what happens here is that the code is run on the created and never passes
in the composable anymore because the prop changes don't re-render the composable.
Hence `isSelectedOption` keeping its initial value.

To keep this reactivity going, we will need to add something to watch the prop
and update `isSelectedOption`.

You should NOT use `onUpdated` in this case because if you do,
you update `isSelectedOption` in it and it calls an update so it re-renders...
you see where I'm going: **Infinite loop**.

The solution is to add a `watch`. There is also another problem.
The destructured element doesn't go out of the watch. We need a new variable
to manage the value with the reactivity we want. I also add a ref,
just to be sure the reactivity is at its maximum!

```vuejs
<script setup>
import { computed, ref, watch } from 'vue';

import AppIcon from '@/components/app/AppIcon';

const emit = defineEmits(['on-select']);
const props = defineProps({
  options: {
    type: Array,
    required: true,
  },
  selectedOption: {
    type: Object,
    required: true,
  },
});

let { isSelectedOption } = useDropDown(props);
let selectedOptionArray = ref(isSelectedOption.value);

watch(() => props.selectedOption, (value) => {
  ({ isSelectedOption } = useDropDown(props));
    selectedOptionArray.value = isSelectedOption.value;
});
</script>
```

Now, we can use `selectedOptionArray` instead of `isSelectedOption`
and have reactivity to the infinite and beyond! 🚀
