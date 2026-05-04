export const handleExport = (columns: any[], tableData: any[]) => {
    // Convert Ant Design table data to CSV format
    // console.log({ tableData });

    const csvContent =
        columns.map((column) => column.title).join(";") +
        "\n" +
        tableData
            .map((row) =>
                columns
                    .map((column) => {
                        if (column.render) {
                            // Use custom render function if present
                            const renderedValue = column.render(
                                row[column.dataIndex],
                                row
                            );
                            const value =
                                renderedValue && renderedValue.props
                                    ? renderedValue.props.children
                                    : renderedValue;
                            return value;
                        } else {
                            return row[column.dataIndex];
                        }
                    })
                    .join(";")
            )
            .join("\n");
    // console.log({ csvContent });
    // return;

    // Create a blob and trigger download
    const blob = new Blob([csvContent], { type: "text/csv" });
    const link = document.createElement("a");
    link.href = URL.createObjectURL(blob);
    link.download = "export.csv";
    document.body.appendChild(link);
    link.click();
    document.body.removeChild(link);
};
