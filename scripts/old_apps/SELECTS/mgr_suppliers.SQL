--仕入先一覧を取得する
SELECT		dtb_maker.maker_id					AS	"メーカーID"
,			dtb_maker.name						AS	"仕入先名"
,			dtb_maker.short_name				AS	"仕入先略称名"
,			dtb_maker.maker_code				AS	"仕入先コード"
,			dtb_maker.exp_supply_flg				AS	"エクス直仕入フラグ"
,			dtb_maker.receive_date_type			AS	"入荷日リードタイム"
,			dtb_maker.large_size_confirm_flg			AS	"大型商品チェック不要フラグ"
,			m_maker_deliv_maker_option.option_type	AS	"メーカー直送新規納品先伝票タイプ"
,			dtb_maker.rank						AS	"表示順"
FROM		dtb_maker
LEFT JOIN		m_maker_deliv_maker_option
ON			dtb_maker.maker_id						=	m_maker_deliv_maker_option.maker_id
AND			m_maker_deliv_maker_option.delete_flg		=	0
WHERE		dtb_maker.del_flg						=	0
AND			dtb_maker.status							=	0
ORDER BY		dtb_maker.rank;