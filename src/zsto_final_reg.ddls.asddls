@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'STO REG'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@UI.headerInfo: {
  typeName:       'Total Record',
  typeNamePlural: 'Total Records',
  title: {
    value: 'PurchaseOrder'
  }
}


define view entity ZSTO_FINAL_REG
  as select from ZSTO_REG4
{
       @UI.lineItem: [{position:10}]
       @EndUserText.label: 'Purchase Order'
       @UI.selectionField: [{ position: 10 }]
  key  PurchaseOrder,
       @UI.lineItem: [{position:11}]
       @EndUserText.label: 'Purchase Order Item'
       @UI.selectionField: [{ position: 11 }]
  key  PurchaseOrderItem,
       @UI.lineItem: [{position:12}]
       @EndUserText.label: 'PGI Document'
  key  PGI_DOC,
       @UI.lineItem: [{position:13}]
       @EndUserText.label: 'PGI Document Item'
  key  pgi_docitem,
       @UI.lineItem: [{position:14}]
       @EndUserText.label: 'PGI Document Year'
  key  pgi_docyear,
       @UI.lineItem: [{position:29}]
       @EndUserText.label: 'GRN Document'
  key  GRN_DOC,
       @UI.lineItem: [{position:30}]
       @EndUserText.label: 'GRN Document Item'
  key  GRN_DOCITEM,
       @UI.lineItem: [{position:31}]
       @EndUserText.label: 'GRN Year'
  key  GRN_YEAR,
       @UI.lineItem: [{position:32}]
       @EndUserText.label: 'GRN QTY'
       @Semantics.quantity.unitOfMeasure: 'MaterialBaseUnit'
       GRN_QTY,
       @UI.lineItem: [{position:32.5}]
       //      @EndUserText.label: 'Stock Change Qty'
       @Semantics.quantity.unitOfMeasure: 'MaterialBaseUnit'
       MatlStkChangeQtyInBaseUnit,


       @UI.lineItem: [{position:33}]
       @EndUserText.label: 'GRN Amount'
       @Semantics.amount.currencyCode: 'CompanyCodeCurrency'
       GRN_AMT,

       @UI.lineItem: [{position:34}]
       @EndUserText.label: 'Receving StorageLocation'
       recv_StorageLocation,
       @UI.lineItem: [{position:35}]
       @EndUserText.label: 'Receving Plant'
       reciving_plant,
       @UI.lineItem: [{position:36}]
       @EndUserText.label: 'Receving Plant Name'
       recv_plant_name,
       @UI.lineItem: [{position:37}]
       @EndUserText.label: 'Receving Date'
       reciving_date,

       @UI.lineItem: [{position:15}]
       @EndUserText.label: 'Issue Amount'
       @Semantics.amount.currencyCode: 'CompanyCodeCurrency'
       issue_amt,
       @UI.lineItem: [{position:16}]
       @EndUserText.label: 'Issue QTY'
       @Semantics.quantity.unitOfMeasure: 'MaterialBaseUnit'
       issue_qty,
       @UI.lineItem: [{position:17}]
       @EndUserText.label: 'Issue StorageLocation'
       issue_StorageLocation,
       @UI.lineItem: [{position:18}]
       @EndUserText.label: 'Supplying Plant'
       suppling_plant,
       @UI.lineItem: [{position:19}]
       @EndUserText.label: 'Supplying Plant Name'
       supp_plant_name,
       @UI.lineItem: [{position:20}]
       @EndUserText.label: 'Issue Date'
       issue_date,
       @UI.lineItem: [{position:21}]
       CompanyCodeCurrency,
       @UI.lineItem: [{position:22}]
       MaterialBaseUnit,

       @UI.lineItem: [{position:40}]
       @EndUserText.label: 'BillingDocument'
       BillingDocument,
       @UI.lineItem: [{position:41}]
       @EndUserText.label: 'Purchase Order Item'
       BillingDocumentDate,
       @UI.lineItem: [{position:42}]
       @EndUserText.label: 'PO Type'
       po_type,
       @UI.lineItem: [{position:42.1}]
       @EndUserText.label: 'PO item deleted.'
       PO_DELETION_CODE,
       @UI.lineItem: [{position:42.2}]
       @EndUserText.label: 'PO Date'
       po_date,

       @UI.lineItem: [{position:42.3}]
       @EndUserText.label: 'PO UOM'
       PO_UOM,

       @UI.lineItem: [{position:42.4}]
       @EndUserText.label: 'PO Qty'
       po_qty,

       @UI.lineItem: [{position:43}]
       @EndUserText.label: 'Your Reference'
       your_ref,
       @UI.lineItem: [{position:44}]
       @EndUserText.label: 'Our Reference'
       our_ref,
       @UI.lineItem: [{position:45}]
       @EndUserText.label: 'Created By'
       cretedby,
       @UI.lineItem: [{position:46}]
       @EndUserText.label: 'HSN Code'
       hsn,
       @UI.lineItem: [{position:47}]
       @EndUserText.label: 'Product Description'
       prd_desc,
       @UI.lineItem: [{position:48}]
       @EndUserText.label: 'Old Material Code'
       old_code,
       @UI.lineItem: [{position:49}]
       @EndUserText.label: 'Manufacture Date'
       ManufactureDate,
       @UI.lineItem: [{position:50}]
       @EndUserText.label: 'Shelf Life Expiration Date'
       ShelfLifeExpirationDate,
       @UI.lineItem: [{position:51}]
       @EndUserText.label: 'Accounting Document'
       AccountingDocument,
       @UI.lineItem: [{position:52}]
       @EndUserText.label: 'Document ReferenceID'
       DocumentReferenceID,
       @UI.lineItem: [{position:53}]
       @EndUserText.label: 'Batch'
       Batch,
       @UI.lineItem: [{position:54}]
       @EndUserText.label: 'DeliveryDocument'
       DeliveryDocument,
       //      @UI.lineItem: [{position:55}]
       //      @EndUserText.label: 'Delivery Document Item'
       //      DeliveryDocumentItem,
       @UI.lineItem: [{position:56}]
       @EndUserText.label: 'DeliveryDate'
       DeliveryDate


}
