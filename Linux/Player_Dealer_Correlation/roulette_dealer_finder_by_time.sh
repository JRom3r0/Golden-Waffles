#!/bin/bash
date '+03/10'
cat 0310_Dealer_schedule | grep '05\|08\|02\|11' 0310_Dealer_schedule | awk -F" " '{print $1, $2, $5, $6}' | grep "Billy\ Jones"
date '+03/12'
cat 0312_Dealer_schedule | grep '05\|08\|02\|11' 0312_Dealer_schedule | awk -F" " '{print $1, $2, $5, $6}' | grep "Billy\ Jones"
date '+03/15'
cat 0315_Dealer_schedule | grep '05\|08\|02\|' 0315_Dealer_schedule | awk -F" " '{print $1, $2, $5, $6}' | grep "Billy\ Jones"
