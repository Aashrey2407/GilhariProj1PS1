import javax.swing.*;
import javax.swing.table.DefaultTableModel;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import org.json.JSONArray;
import org.json.JSONObject;

public class Main {
    public static void main(String[] args) {
        // Create JFrame
        JFrame frame = new JFrame("Employee Form");
        frame.setSize(800, 600);
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setLayout(null);

        // Create JTextFields and JLabels for id, exempt, compensation, and name
        JLabel idLabel = new JLabel("ID:");
        idLabel.setBounds(20, 20, 100, 30);
        frame.add(idLabel);

        JTextField idField = new JTextField();
        idField.setBounds(150, 20, 200, 30);
        frame.add(idField);

        JLabel exemptLabel = new JLabel("Exempt:");
        exemptLabel.setBounds(20, 60, 100, 30);
        frame.add(exemptLabel);

        JTextField exemptField = new JTextField();
        exemptField.setBounds(150, 60, 200, 30);
        frame.add(exemptField);

        JLabel compensationLabel = new JLabel("Compensation:");
        compensationLabel.setBounds(20, 100, 100, 30);
        frame.add(compensationLabel);

        JTextField compensationField = new JTextField();
        compensationField.setBounds(150, 100, 200, 30);
        frame.add(compensationField);

        JLabel nameLabel = new JLabel("Name:");
        nameLabel.setBounds(20, 140, 100, 30);
        frame.add(nameLabel);

        JTextField nameField = new JTextField();
        nameField.setBounds(150, 140, 200, 30);
        frame.add(nameField);

        // Create JButton for sending GET request
        JButton button = new JButton("Send GET Request");
        button.setBounds(20, 180, 200, 30);
        frame.add(button);

        // Create JTable for displaying response in tabular format
        DefaultTableModel tableModel = new DefaultTableModel();
        JTable resultTable = new JTable(tableModel);
        JScrollPane scrollPane = new JScrollPane(resultTable);
        scrollPane.setBounds(20, 220, 750, 320);
        frame.add(scrollPane);

        // Add action listener to button
        button.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                try {
                    // Get entered details
                    String idText = idField.getText();
                    String exemptText = exemptField.getText();
                    String compensationText = compensationField.getText();
                    String nameText = nameField.getText();

                    // Construct the URL with query parameters
                    String url = "http://localhost:80/gilhari/v1/Test";
                    boolean firstParam = true;
                    if(!idText.isEmpty()) {
                        char firstCharacter = idText.charAt(0);
                        if (firstCharacter >= '0' && firstCharacter <= '9') {
                            url = url + "?filter=id=" + idText;
                        }
                        if (firstCharacter == '<') {
                            url = url + "?filter=id" + idText;
                        }
                        if (firstCharacter == '>') {
                            url = url + "?filter=id" + idText;
                        }
                        firstParam = false;
                    }
                    if(!exemptText.isEmpty()){
                        if(!firstParam){
                            url = url + URLEncoder.encode(" AND " + "exempt=" + exemptText,"UTF-8");
                        }
                        else {
                            url = url + "?filter=exempt=" + URLEncoder.encode(exemptText,"UTF-8");
                        }
                        firstParam = false;
                    }
                    if(!compensationText.isEmpty()) {
                        char firstCharacter = compensationText.charAt(0);
                        if(!firstParam){
                            url = url + URLEncoder.encode(" AND ");
                        }
                        else{
                            url = url + "?filter=";
                        }
                        if (firstCharacter >= '0' && firstCharacter <= '9') {
                            url = url + URLEncoder.encode("compensation=" + compensationText,"UTF-8");
                        }
                        if (firstCharacter == '<') {
                            url = url + URLEncoder.encode("compensation" + compensationText,"UTF-8");
                        }
                        if (firstCharacter == '>') {
                            url = url + URLEncoder.encode("compensation" + compensationText,"UTF-8");
                        }
                        firstParam = false;
                    }
                    if(!nameText.isEmpty()){
                        if(!firstParam){
                            url = url + URLEncoder.encode(" AND " + "name=" + "'" + nameText + "'","UTF-8" );
                        }
                        else {
                            url = url + "?filter=name=" + URLEncoder.encode("'" + nameText + "'","UTF-8");
                        }
                        firstParam = false;
                    }

                    // Make the HTTP GET request
                    HttpURLConnection httpClient = (HttpURLConnection) new URL(url).openConnection();

                    // Optional default is GET
                    httpClient.setRequestMethod("GET");

                    int responseCode = httpClient.getResponseCode();
                    System.out.println("Response Code: " + responseCode);

                    // Get response
                    BufferedReader in = new BufferedReader(new InputStreamReader(httpClient.getInputStream()));
                    String inputLine;
                    StringBuilder response = new StringBuilder();

                    while ((inputLine = in.readLine()) != null) {
                        response.append(inputLine);
                    }
                    in.close();

                    // Print result
                    System.out.println("Response: " + response.toString());

                    // Parse JSON response
                    JSONArray jsonArray = new JSONArray(response.toString());

                    // Clear table model
                    tableModel.setRowCount(0);
                    tableModel.setColumnCount(0);

                    // Populate table headers
                    JSONObject firstObject = jsonArray.getJSONObject(0); // Assuming at least one object for headers
                    for (String key : firstObject.keySet()) {
                        tableModel.addColumn(key);
                    }

                    // Populate table data
                    for (int i = 0; i < jsonArray.length(); i++) {
                        JSONObject jsonObject = jsonArray.getJSONObject(i);
                        Object[] rowData = new Object[firstObject.length()];
                        int index = 0;
                        for (String key : firstObject.keySet()) {
                            rowData[index++] = jsonObject.get(key);
                        }
                        tableModel.addRow(rowData);
                    }

                    // Clear text fields after successful request
                    idField.setText("");
                    exemptField.setText("");
                    compensationField.setText("");
                    nameField.setText("");

                } catch (Exception ex) {
                    ex.printStackTrace();
                }
            }
        });

        // Set frame visibility
        frame.setVisible(true);
    }
}
