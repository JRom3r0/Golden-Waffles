#!/bin/bash
cat 0312_Dealer_schedule | awk -F" " '{print $1, $2, $5,$6}'| grep "Billy\ Jones" >> Dealers_working_during_losses

