import React, { useEffect, useState } from "react";
import Navbar from "./Navbar";
import Footer from "./Footer";
import "../css/Order.css";
import axios from "axios";

const BASE_URL = "http://localhost:4000";

const Order = () => {
  const [orderItems, setOrderItems] = useState([]);
  const [detailedOrders, setDetailedOrders] = useState([]);
  const [bayarModalOpen, setBayarModalOpen] = useState(false);
  const [currentOrderId, setCurrentOrderId] = useState(null); // State to track the current order ID being processed

  const openBayarModal = async (id_product) => {
    setCurrentOrderId(id_product); // Set the current order ID before opening the modal
    setBayarModalOpen(true);
  };

  const closeBayarModal = () => {
    setCurrentOrderId(null); // Clear the current order ID when closing the modal
    setBayarModalOpen(false);
  };

  const formatter = new Intl.NumberFormat("id-ID", {
    style: "currency",
    currency: "IDR",
  });

  useEffect(() => {
    const fetchOrder = async () => {
      const token = localStorage.getItem("token");

      if (!token) {
        throw new Error("User not authenticated");
      }

      try {
        const response = await axios.get(`${BASE_URL}/order/transaction`, {
          headers: {
            Authorization: `Bearer ${token}`,
          },
        });
        setOrderItems(response.data.payload);

        // Fetch detailed order information for each order item
        const detailedData = await Promise.all(
          response.data.payload.map(async (item) => {
            const detailResponse = await axios.get(
              `${BASE_URL}/order/transaction-detail/${item.no_order}`,
              {
                headers: {
                  Authorization: `Bearer ${token}`,
                },
              }
            );
            return detailResponse.data.payload;
          })
        );

        setDetailedOrders(detailedData);
      } catch (error) {
        console.error("Error fetching orders:", error);
      }
    };

    fetchOrder();
  }, []);

  return (
    <>
      <Navbar />
      <div className="app-container">
        <div className="content-wrap">
          <div className="container py-5 h-100 mt-5">
            <div className="row">
              <div className="col-12 col-sm-12">
                <div className="card card-primary card-outline card-outline-tabs">
                  <div className="card-header border-bottom-0">
                    <h1 className="text-center">Pesanan Saya</h1>
                  </div>
                  <div className="card-body">
                    <div className="list-group">
                      {orderItems.map((item, index) => (
                        <div
                          className="list-group-item list-group-item-action d-flex gap-3 py-3"
                          key={item.no_order}
                        >
                          <div className="d-flex gap-2 w-100 justify-content-between align-items-center">
                            <div>
                              <h6 className="mb-0 fw-bold">
                                No Order : {item.no_order}
                              </h6>
                              <p className="mb-0 opacity-75">
                                Total Bayar :{" "}
                                {formatter.format(item.total_bayar)}
                              </p>
                            </div>
                            <div>
                              <h6 className="mb-0 fw-bold">Detail Pesanan</h6>
                              <p className="mb-0 opacity-75">
                                {detailedOrders[index] &&
                                  detailedOrders[index].map((detail) => (
                                    <div key={detail.id_detail}>
                                      <h6>
                                        {detail.product_name} x{" "}
                                        {detail.quantity}
                                      </h6>
                                      {/* Add more details as needed */}
                                    </div>
                                  ))}
                              </p>
                            </div>
                            <div>
                              {item.status_bayar === 0 && (
                                <button
                                  type="button"
                                  className="edit-button"
                                  onClick={() => openBayarModal(item.no_order)}
                                >
                                  Bayar Sekarang
                                </button>
                              )}
                            </div>
                            <div className="text-end">
                              <small className="opacity-50 text-nowrap">
                                {new Date(item.order_date).toLocaleDateString()}
                              </small>
                              <p className="mb-0">
                                {item.status_bayar === 0 && (
                                  <span className="badge text-bg-warning">
                                    Belum Bayar
                                  </span>
                                )}
                              </p>
                            </div>
                          </div>
                        </div>
                      ))}
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>

          {bayarModalOpen && (
            <div className="modal">
              <div className="modal-content-order">
                <div className="modal-header">
                  <h5 className="modal-title">Pembayaran</h5>
                  <button
                    type="button"
                    className="close"
                    onClick={closeBayarModal}
                  >
                    <span>&times;</span>
                  </button>
                </div>
                <div className="modal-body">
                  <div className="row">
                    <div className="col-6">
                      <div className="card card-primary">
                        <div className="card-header">
                          <h3 className="card-title">No Rekening</h3>
                        </div>
                        <div className="card-body">
                          <div className="form-group">
                            <p>
                              Silahkan transfer ke nomor rekening berikut
                              sejumlah :
                            </p>
                            <h1 className="text-primary">
                              {formatter.format(
                                orderItems.find(
                                  (item) => item.no_order === currentOrderId
                                ).total_bayar
                              )}
                            </h1>
                            <p />
                            <table className="table">
                              <tbody>
                                <tr>
                                  <th>Bank</th>
                                  <th>No Rekening</th>
                                  <th>Atas Nama</th>
                                </tr>
                                <tr>
                                  <td>Bank Mandiri</td>
                                  <td>132-003600-0009</td>
                                  <td>RAFR</td>
                                </tr>
                                <tr>
                                  <td>Bank Central Asia (BCA)</td>
                                  <td>6280-66-9600</td>
                                  <td>RAFR</td>
                                </tr>
                              </tbody>
                            </table>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div className="col-6">
                      <div className="card card-primary">
                        <div className="card-body">
                          <form>
                            <div className="form-group">
                              <label>Nama Bank:</label>
                              <input
                                type="text"
                                name="bankName"
                                className="form-control"
                              />
                              <label>Nama Pemilik Rekening:</label>
                              <input
                                type="text"
                                name="accountOwner"
                                className="form-control"
                              />
                              <label>No rekening:</label>
                              <input
                                type="text"
                                name="accountNumber"
                                className="form-control"
                              />

                              <label>Bukti Bayar:</label>
                              <input
                                type="file"
                                className="form-control-file"
                              />
                            </div>

                            <button
                              type="button"
                              className="btn btn-edit-admin"
                            >
                              Bayar
                            </button>
                          </form>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          )}
        </div>
        <Footer />
      </div>
    </>
  );
};

export default Order;
