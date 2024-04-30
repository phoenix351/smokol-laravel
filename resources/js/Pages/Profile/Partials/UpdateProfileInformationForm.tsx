import { usePage } from "@inertiajs/react";

import { PageProps } from "@/types";

import { Form, Input, Button } from "antd";
import { router } from "@inertiajs/react";
export default function UpdateProfileInformation({ auth }: PageProps) {
    const form = Form.useForm();
    console.log({ auth });

    const handleSave = (values: any) => {
        console.log(values);

        // router.visit(route("profile.update"), {
        //     method: "patch",
        //     data: values,
        // });
    };

    return (
        <section>
            <header>
                <h2 className="text-lg font-medium text-gray-900">
                    Profile Information
                </h2>
                <p>
                    Update your account's profile information and email address.
                </p>
            </header>
        </section>
    );
}
