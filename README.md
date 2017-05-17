#电商系统中的商品模型的分析与设计 

从SPU、SKU开始
    首先我们需要澄清上篇中的这两个概念，“货品”是指一种概念物品，这种物品并不是一个具体的实物，当它具备具体的属性、价格时，才是一种实物，也就是商品。“商品”就是库存中一个具体的实物。例如：iphone6，就是一种货品，但用户购买的并不是货品而是商品，也就是用户最终购买的可能是：金色-16G-移动版 iphone6。换句话来说，货品是一种产品的称谓（如iphone6），商品是用户购买的具体实物，具备特定的属性（如：金色-16G-移动版）。如果觉得这样理解还是比较混，那么忘记这两个概念，下面讲标准化的名称。
    我们刚才说的iphone6，书面称谓叫“SPU” Standard Product Unit （标准化产品单元），它是最接近用户认知的产品单元，比如用户说，我想买个iphone4、iphone6、小米4，这些都是SPU，也就是用户普遍认知范围内的一种产品。然而在电商系统中只有SPU并没有什么卵用，用户购买时肯定要确定，需要什么颜色、多少G的，支持什么网络。所以，例如金色-16G-移动版 iphone6，就需要一个名称去规范它，这个名称叫“SKU” Stock Keeping Unit(库存单元)，换句话理解就是库存里面存的东西，库存里存在东西肯定是具体的某种规格的iphone6。基于这个理解，我们先画下图：
    
