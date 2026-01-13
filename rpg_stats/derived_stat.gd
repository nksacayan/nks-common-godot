@tool
extends BaseStat
class_name DerivedStat

# Could be multiple stats that lead to this product
var source_stat: Array[BaseStat]

# formula to get the value?