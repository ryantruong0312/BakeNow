/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.bakenow.core.model.test;

import static org.junit.jupiter.api.Assertions.*;
import static com.bakenow.core.model.Product.*;
import static com.bakenow.core.model.Cart.*;
import org.junit.jupiter.api.*;

import com.bakenow.core.model.Cart;
import com.bakenow.core.model.CartItem;
import com.bakenow.core.model.Product;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.stream.Stream;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.MethodSource;

/**
 *
 * @author Admin
 */
@TestInstance(value = TestInstance.Lifecycle.PER_CLASS)
@TestMethodOrder(MethodOrderer.OrderAnnotation.class)
public class CartTest {

    private class PProduct extends Product {

        public PProduct(Integer id, Double price) {
            super(id);
            this.setPrice(price);
        }
    }

    private Cart buildCart(Double[][] params) {
        Map<Integer, CartItem> cartItems = new ConcurrentHashMap<>();
        double total = 0;
        Product p;
        CartItem ci;
        for (Double[] param : params) {
            p = aProduct().withId(param[0].intValue()).withPrice(param[1]);
            ci = new CartItem(p, param[2].intValue());
            cartItems.put(p.getId(), ci);
            total += param[1] * param[2];
        }
        return aCart().withCartItems(cartItems).withTotal(total);
    }

    private Cart buildInitCart() {
        return buildCart(new Double[][]{
            {1d, 75d, 4d},
            {2d, 50d, 3d},
            {3d, 40d, 2d},
            {4d, 20d, 1d}
        });
    }

    private static class CartAction {

        Integer id;
        Double price;
        Integer quantity;
        Double expectedTotal;
        Double[][] expectedCart;

        public CartAction(Integer id, Double price, Integer quantity, Double expectedTotal, Double[][] expectedCart) {
            this.id = id;
            this.price = price;
            this.quantity = quantity;
            this.expectedTotal = expectedTotal;
            this.expectedCart = expectedCart;
        }
    }

    private static Stream<CartAction> testAdd_GivenOneExistingCartItem_IncreasesQuantityOfThat() {

        return Stream.of(
                new CartAction(1, 75d, 8, 1150d,
                        new Double[][]{
                            {1d, 75d, 12d},
                            {2d, 50d, 3d},
                            {3d, 40d, 2d},
                            {4d, 20d, 1d}
                        }),
                new CartAction(3, 40d, 5, 750d,
                        new Double[][]{
                            {1d, 75d, 4d},
                            {2d, 50d, 3d},
                            {3d, 40d, 7d},
                            {4d, 20d, 1d}
                        }),
                new CartAction(2, 50d, 2, 650d,
                        new Double[][]{
                            {1d, 75d, 4d},
                            {2d, 50d, 5d},
                            {3d, 40d, 2d},
                            {4d, 20d, 1d}
                        })
        );
    }

    @DisplayName("Add 1 existing cart item to cart")
    @ParameterizedTest
    @MethodSource()
    void testAdd_GivenOneExistingCartItem_IncreasesQuantityOfThat(CartAction ca) {
        Cart expCart = buildCart(ca.expectedCart);
        expCart.setTotal(ca.expectedTotal);
        Cart actCart = buildInitCart();

        CartItem svcCartItem = new CartItem(aProduct().withId(ca.id).withPrice(ca.price), ca.quantity);
        actCart.add(svcCartItem);

        assertEquals(expCart, actCart);
        assertEquals(expCart.getTotal(), actCart.getTotal());
    }

    private static Stream<CartAction> testAdd_GivenOneNewCartItem_AddsThat() {

        return Stream.of(
                new CartAction(0, 100d, 10, 1550d,
                        new Double[][]{
                            {1d, 75d, 4d},
                            {2d, 50d, 3d},
                            {3d, 40d, 2d},
                            {4d, 20d, 1d},
                            {0d, 100d, 10d}
                        }),
                new CartAction(-8, 0d, 99, 550d,
                        new Double[][]{
                            {1d, 75d, 4d},
                            {2d, 50d, 3d},
                            {-8d, 0d, 99d},
                            {3d, 40d, 2d},
                            {4d, 20d, 1d}
                        }),
                new CartAction(5, 100d, 2, 750d,
                        new Double[][]{
                            {1d, 75d, 4d},
                            {2d, 50d, 3d},
                            {3d, 40d, 2d},
                            {4d, 20d, 1d},
                            {5d, 100d, 2d}
                        })
        );
    }

    @DisplayName("Add 1 new cart item to cart")
    @ParameterizedTest
    @MethodSource()
    void testAdd_GivenOneNewCartItem_AddsThat(CartAction ca) {
        Cart expCart = buildCart(ca.expectedCart);
        expCart.setTotal(ca.expectedTotal);
        Cart actCart = buildInitCart();

        CartItem svcCartItem = new CartItem(aProduct().withId(ca.id).withPrice(ca.price), ca.quantity);
        actCart.add(svcCartItem);

        assertEquals(expCart, actCart);
        assertEquals(expCart.getTotal(), actCart.getTotal());
    }

    private static Stream<CartAction> testUpdate_GivenOneExistingCartItemWithPositiveQuantity_ChangesQuantityOfThatAndReturnsTrue() {

        return Stream.of(
                new CartAction(1, 75d, 8, 850d,
                        new Double[][]{
                            {1d, 75d, 8d},
                            {2d, 50d, 3d},
                            {3d, 40d, 2d},
                            {4d, 20d, 1d}
                        }),
                new CartAction(3, 40d, 1, 510d,
                        new Double[][]{
                            {1d, 75d, 4d},
                            {2d, 50d, 3d},
                            {3d, 40d, 1d},
                            {4d, 20d, 1d}
                        }),
                new CartAction(2, 50d, 3, 550d,
                        new Double[][]{
                            {1d, 75d, 4d},
                            {2d, 50d, 3d},
                            {3d, 40d, 2d},
                            {4d, 20d, 1d}
                        })
        );
    }

    private static Stream<CartAction> testAdd_GivenOneCartItemWithZeroOrNegativeQuantity_ThrowsIllegalArgumentException() {

        return Stream.of(
                new CartAction(1, 75d, 0, 550d,
                        new Double[][]{
                            {1d, 75d, 4d},
                            {2d, 50d, 3d},
                            {3d, 40d, 2d},
                            {4d, 20d, 1d}
                        }),
                new CartAction(3, 40d, -5, 550d,
                        new Double[][]{
                            {1d, 75d, 4d},
                            {2d, 50d, 3d},
                            {3d, 40d, 2d},
                            {4d, 20d, 1d}
                        }),
                new CartAction(5, 100d, -69420, 750d,
                        new Double[][]{
                            {1d, 75d, 4d},
                            {2d, 50d, 3d},
                            {3d, 40d, 2d},
                            {4d, 20d, 1d},})
        );
    }

    @DisplayName("Add 1 cart item to cart")
    @ParameterizedTest
    @MethodSource()
    void testAdd_GivenOneCartItemWithZeroOrNegativeQuantity_ThrowsIllegalArgumentException(CartAction ca) {
        Cart expCart = buildCart(ca.expectedCart);
        expCart.setTotal(ca.expectedTotal);
        Cart actCart = buildInitCart();

        CartItem svcCartItem = new CartItem(aProduct().withId(ca.id).withPrice(ca.price), ca.quantity);

        assertThrowsExactly(IllegalArgumentException.class, () -> {
            actCart.add(svcCartItem);
        });
    }

    @DisplayName("Update 1 existing cart item in cart with positive quantity")
    @ParameterizedTest
    @MethodSource()
    void testUpdate_GivenOneExistingCartItemWithPositiveQuantity_ChangesQuantityOfThatAndReturnsTrue(CartAction ca) {
        Cart expCart = buildCart(ca.expectedCart);
        expCart.setTotal(ca.expectedTotal);
        Cart actCart = buildInitCart();

        CartItem svcCartItem = new CartItem(aProduct().withId(ca.id).withPrice(ca.price), ca.quantity);

        assertTrue(actCart.update(svcCartItem));
        assertEquals(expCart, actCart);
        assertEquals(expCart.getTotal(), actCart.getTotal());
    }

    private static Stream<CartAction> testUpdate_GivenOneNewCartItem_MakesNoChangesAndReturnsFalse() {

        return Stream.of(
                new CartAction(0, 0d, 1, 550d,
                        new Double[][]{
                            {1d, 75d, 4d},
                            {2d, 50d, 3d},
                            {3d, 40d, 2d},
                            {4d, 20d, 1d}
                        }),
                new CartAction(51, 1220d, 85, 550d,
                        new Double[][]{
                            {1d, 75d, 4d},
                            {2d, 50d, 3d},
                            {3d, 40d, 2d},
                            {4d, 20d, 1d}
                        }),
                new CartAction(5, 100d, 2, 550d,
                        new Double[][]{
                            {1d, 75d, 4d},
                            {2d, 50d, 3d},
                            {3d, 40d, 2d},
                            {4d, 20d, 1d}
                        })
        );
    }

    @DisplayName("Update 1 non-existing cart item in cart")
    @ParameterizedTest
    @MethodSource()
    void testUpdate_GivenOneNewCartItem_MakesNoChangesAndReturnsFalse(CartAction ca) {
        Cart expCart = buildCart(ca.expectedCart);
        expCart.setTotal(ca.expectedTotal);
        Cart actCart = buildInitCart();

        CartItem svcCartItem = new CartItem(aProduct().withId(ca.id).withPrice(ca.price), ca.quantity);

        assertFalse(actCart.update(svcCartItem));
        assertEquals(expCart, actCart);
        assertEquals(expCart.getTotal(), actCart.getTotal());
    }

    private static Stream<CartAction> testRemove_GivenOneExistingCartItem_RemovesThatAndReturnsTrue() {

        return Stream.of(
                new CartAction(1, 75d, 8, 250d,
                        new Double[][]{
                            {2d, 50d, 3d},
                            {3d, 40d, 2d},
                            {4d, 20d, 1d}
                        }),
                new CartAction(3, 40d, 5, 470d,
                        new Double[][]{
                            {1d, 75d, 4d},
                            {2d, 50d, 3d},
                            {4d, 20d, 1d}
                        }),
                new CartAction(3, 40d, 2, 470d,
                        new Double[][]{
                            {1d, 75d, 4d},
                            {2d, 50d, 3d},
                            {4d, 20d, 1d}
                        })
        );
    }

    @DisplayName("Remove 1 existing cart item from cart")
    @ParameterizedTest
    @MethodSource()
    void testRemove_GivenOneExistingCartItem_RemovesThatAndReturnsTrue(CartAction ca) {
        Cart expCart = buildCart(ca.expectedCart);
        expCart.setTotal(ca.expectedTotal);
        Cart actCart = buildInitCart();

        CartItem svcCartItem = new CartItem(aProduct().withId(ca.id).withPrice(ca.price), ca.quantity);

        assertTrue(actCart.remove(svcCartItem));
        assertEquals(expCart, actCart);
        assertEquals(expCart.getTotal(), actCart.getTotal());
    }

    private static Stream<CartAction> testRemove_GivenOneNewCartItem_MakesNoChangesAndReturnsFalse() {

        return Stream.of(
                new CartAction(0, 60d, 8, 550d,
                        new Double[][]{
                            {1d, 75d, 4d},
                            {2d, 50d, 3d},
                            {3d, 40d, 2d},
                            {4d, 20d, 1d}
                        }),
                new CartAction(-5, -20d, 0, 550d,
                        new Double[][]{
                            {1d, 75d, 4d},
                            {2d, 50d, 3d},
                            {3d, 40d, 2d},
                            {4d, 20d, 1d}
                        }),
                new CartAction(5, 100d, 2, 550d,
                        new Double[][]{
                            {1d, 75d, 4d},
                            {2d, 50d, 3d},
                            {3d, 40d, 2d},
                            {4d, 20d, 1d}
                        })
        );
    }

    @DisplayName("Remove 1 non-existing cart item from cart")
    @ParameterizedTest
    @MethodSource()
    void testRemove_GivenOneNewCartItem_MakesNoChangesAndReturnsFalse(CartAction ca) {
        Cart expCart = buildCart(ca.expectedCart);
        expCart.setTotal(ca.expectedTotal);
        Cart actCart = buildInitCart();

        CartItem svcCartItem = new CartItem(aProduct().withId(ca.id).withPrice(ca.price), ca.quantity);

        assertFalse(actCart.remove(svcCartItem));
        assertEquals(expCart, actCart);
        assertEquals(expCart.getTotal(), actCart.getTotal());
    }

//    @Nested
//    @DisplayName("Series of actions")
//    class CartActionSeries {
//        
//        @Test
//        void testTest() {
//            assertTrue(true);
//        }
//
//        Cart actCart;
//
//        private static Stream<CartAction> addCartActionSeriesProvider() {
//
//            return Stream.of(
//                    new CartAction(1, 75d, 8, 1150d,
//                            new Double[][]{
//                                {1d, 75d, 12d},
//                                {2d, 50d, 3d},
//                                {3d, 40d, 2d},
//                                {4d, 20d, 1d}
//                            }),
//                    new CartAction(3, 40d, 5, 750d,
//                            new Double[][]{
//                                {1d, 75d, 12d},
//                                {2d, 50d, 3d},
//                                {3d, 40d, 7d},
//                                {4d, 20d, 1d}
//                            }),
//                    new CartAction(5, 100d, 2, 750d,
//                            new Double[][]{
//                                {1d, 75d, 4d},
//                                {2d, 50d, 3d},
//                                {3d, 40d, 2d},
//                                {4d, 20d, 1d},
//                                {5d, 100d, 2d}
//                            })
//            );
//        }
//
//        @DisplayName("Add 3 cart items to cart")
//        @ParameterizedTest
//        @MethodSource("addCartActionSeriesProvider")
//        void testAddGivenOneCartItemArgumentBehavesWell(CartAction ca) {
//            Cart expCart = buildCart(ca.expCart);
//            expCart.setTotal(ca.expTotal);
//            actCart = buildInitCart();
//
//            CartItem svcCartItem = new CartItem(new PProduct(ca.id, ca.price), ca.quantity);
//            actCart.add(svcCartItem);
//
//            assertEquals(expCart, actCart);
//            assertEquals(expCart.getTotal(), actCart.getTotal());
//        }
//    }
}
