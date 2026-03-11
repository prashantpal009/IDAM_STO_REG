@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'STO REGISTER'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZSTTO_REG2
  as select distinct from ZSTO_REG1              as A
    left outer join       I_DeliveryDocumentItem as B on  B.ReferenceSDDocument     = A.PurchaseOrder
                                                      and B.ReferenceSDDocumentItem = A.PurchaseOrderItem
    left outer join       I_DeliveryDocument     as E on E.DeliveryDocument = B.DeliveryDocument
    left outer join       I_BillingDocumentItem  as C on  C.ReferenceSDDocument     = B.DeliveryDocument
                                                      and C.ReferenceSDDocumentItem = B.DeliveryDocumentItem

    left outer join       I_BillingDocument      as d on d.BillingDocument = C.BillingDocument
    left outer join       I_JournalEntry         as g on  g.DocumentReferenceID = d.DocumentReferenceID
                                                      and g.TransactionCode     = 'J_1IG_INV'


{

  key  A.PurchaseOrder,
  key  A.PurchaseOrderItem,
  key  B.DeliveryDocument,
  key  B.DeliveryDocumentItem,
       B.ReferenceSDDocument,
       B.ReferenceSDDocumentItem,
       A.PurchaseOrderCategory,
       C.BillingDocument,
       E.DeliveryDate,
       C.BillingDocumentItem,
       C.BillingDocumentDate,
       d.BillingDocumentIsCancelled,
       d.CancelledBillingDocument,
       g.AccountingDocument,
       d.DocumentReferenceID



}
