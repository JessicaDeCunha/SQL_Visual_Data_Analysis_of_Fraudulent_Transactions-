SELECT  CH.customer_id, TR.date, TR.amount, TR.card, CC.card, tr.id_merchant, MC.merchant_name
	FROM card_holder CH
	
	JOIN credit_card CC
	
	ON CH.customer_id = CC.cardholder_id

	JOIN transactions TR
	
	ON TR.card = CC.card
	
	JOIN merchant ME
	
	ON TR.id_merchant = ME.id_merchat_category
	
	JOIN merchant_category MC
	
	ON TR.id_merchant = MC.merchant_id
	
WHERE CH.customer_id IN ('2', '18')
