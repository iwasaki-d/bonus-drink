class BonusDrink

  AMOUNT_OF_BOTTLE_EXCHANGE = 3

  def self.total_count_for(amount = 0)

    if amount < 0
      return 0
    end

    drinkable_bottle_sum = amount #引数で渡された本数分は飲める
    current_empty_bottle_sum = amount #引数で渡された本数分だけ空ビンがある

    until current_empty_bottle_sum < AMOUNT_OF_BOTTLE_EXCHANGE #手持ちの空き瓶数が交換数量を下回るまで空き瓶を交換に出す

      exchange_result = exchange_bottles(current_empty_bottle_sum)

      new_bottle_amount = exchange_result[:NEW_BOTTLE_KEY]

      #もらった本数と戻ってきた空き瓶が交換に出す事ができる空き瓶数
      current_empty_bottle_sum =  new_bottle_amount  + exchange_result[:EMPTY_BOTTLE_KEY]

      drinkable_bottle_sum = drinkable_bottle_sum + new_bottle_amount # 交換によって得られた本数を飲める数に加える

    end

    printf("#{amount}本購入すると、#{drinkable_bottle_sum}本飲む事ができます")

    return drinkable_bottle_sum
  end

  # 10本以上交換はおまけの1本追加なども考えらえるのでメソッド化
  def self.exchange_bottles(amount)

    if amount < 0
      new_bottle_amount = 0
      empty_bottle_amount = 0
    else
      new_bottle_amount = amount / AMOUNT_OF_BOTTLE_EXCHANGE #交換によって、もらえた新しいボトル
      empty_bottle_amount = amount % AMOUNT_OF_BOTTLE_EXCHANGE #交換できずに残った空ボトル
    end

    change_result_hash = {NEW_BOTTLE_KEY: new_bottle_amount, EMPTY_BOTTLE_KEY: empty_bottle_amount}

    return change_result_hash

  end

end

BonusDrink.total_count_for(100)
