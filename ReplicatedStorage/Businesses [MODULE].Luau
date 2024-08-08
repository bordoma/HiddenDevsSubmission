-- Information depository for businesses. Accesed by most scripts

local module = {
	['LemonadeStand'] = {
		['Name'] = 'Lemonade Stand',
		['Enabled'] =  true,
		['UniqueID'] = 1,
		['SortOrder'] = 1,
		['BasePrice'] = 5,
		['BaseRunTime'] = 3,
		['BaseReward'] = 1,
	},
	['NewspaperDelivery'] = {
		['Name'] = 'Newspaper Delivery',
		['Enabled'] =  true,
		['UniqueID'] = 2,
		['SortOrder'] = 2,
		['BasePrice'] = 150,
		['BaseRunTime'] = 5,
		['BaseReward'] = 20,
	},
	['CarWash'] = {
		['Name'] = 'Car Wash',
		['Enabled'] =  true,
		['UniqueID'] = 3,
		['SortOrder'] = 3,
		['BasePrice'] = 750,
		['BaseRunTime'] = 10,
		['BaseReward'] = 50,
	},
	['PizzaDelivery'] = {
		['Name'] = 'Pizza Delivery',
		['Enabled'] =  true,
		['UniqueID'] = 4,
		['SortOrder'] = 4,
		['BasePrice'] = 10000,
		['BaseRunTime'] = 25,
		['BaseReward'] = 1000,
	},
}

return module
