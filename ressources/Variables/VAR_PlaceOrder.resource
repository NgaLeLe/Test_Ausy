*** Variables ***
${user_card}        Dupont
${city_card}        Antibes
${country_card}     France
${number_card}      0987 1234 2346 1239 0987
${month_card}       3
${year_card}        2023

&{info_card}        name=${user_card}   city=${city_card}   country=${country_card}
...                 card=${number_card}     month=${month_card}     year=${year_card}


&{info_card_invalid}        name=   city=${city_card}   country=${country_card}
...                         card=     month=${month_card}     year=${year_card}
